// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_collision(target_object){
	var tol = meta_game.grid_scale/200;

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
			x_new = _list_col_x[| ii].x - sign(dx) * meta_game.grid_scale;
			y_new = y_test;
		}
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
			y_new = _list_col_y[| ii].y - sign(dy) * (meta_game.grid_scale + tol);
		}
	}
	
	// Create Map to store results of collision check
	coords[?"tol"] = tol;
	coords[?"x_new"] = x_new;
	coords[?"y_new"] = y_new;
	coords[?"dx"] = dx;
	coords[?"dy"] = dy;

	return coords;
}