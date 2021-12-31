// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_collision(target_object, results){
	results[?"vert_collide"] = false;
	results[?"horiz_collide"] = false;
	
	var tol = meta_game.grid_scale/400;

	var x_test = x + hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
	var y_test = y + vspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;

	var x_new = x_test;
	var y_new = y_test;
	
	var dx = 0;
	var dy = 0;
	
	// Check Collisions	with floors and walls	
	var _list_col_x= ds_list_create();
	var _num = instance_place_list(x_test, y, target_object,_list_col_x, false);	
	if (_num == 0) {
		show_debug_message("No X Collision");
	}
	
	if (_num > 0)
	{
		for (var ii = 0; ii < _num; ++ii) {
			var dx = _list_col_x[| ii].x - x;
			var dy = _list_col_x[| ii].y - y;
		
			show_debug_message(">>>X Collision  dx=" + string(dx) + " dy=" + string(dy));
			
			// Modify x position based on collision
			if dx>0 {
				x_new = _list_col_x[| ii].x - sign(dx) * sprite_width;
				}
			if dx<0 {
				x_new = _list_col_x[| ii].x - sign(dx) * meta_game.grid_scale;
				}
			y_new = y_test;
		}
		results[?"horiz_collide"] = true;
	}
	
	// check vert collisions with floors and walls
	var _list_col_y = ds_list_create();
	var _num = instance_place_list(x_new, y_test, target_object,_list_col_y, false);	
	if (_num == 0) {
		show_debug_message("No Y Collision");
	}
	if (_num > 0)
	{
		for (var ii = 0; ii < _num; ++ii) {
			var dx = _list_col_y[| ii].x - x;
			var dy = _list_col_y[| ii].y - y;
		
			show_debug_message(">>>Y Collision  dx=" + string(dx) + " dy=" + string(dy));
			y_new = _list_col_y[| ii].y - sign(dy) * (sprite_height);
		
		     // Modify y position based on collision
			if dy>0 {
				y_new = _list_col_y[| ii].y - sign(dy) * sprite_width;
			}
			if dy<0 {
				y_new = _list_col_y[| ii].y - sign(dy) * meta_game.grid_scale;
			}
		}
		results[?"vert_collide"] = true;
	}
	
	// Create Map to store results of collision check
	results[?"tol"] = tol;
	results[?"x_new"] = x_new;
	results[?"y_new"] = y_new;
	results[?"dx"] = dx;
	results[?"dy"] = dy;
}