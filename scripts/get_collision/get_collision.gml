// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_collision(target_object, results){
	// Local default variables
	results[?"vert_collide"] = false;
	results[?"horiz_collide"] = false;
	//var tol = meta_game.grid_scale/400;
	var x_test = x + hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
	var y_test = y + vspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
	var x_new = x_test;
	var y_new = y_test;
	dx = 0;
	dy = 0;
	
	// Check Collisions	with target object on the horizonatal axis first
	var _list_col_x= ds_list_create();
	var _num = instance_place_list(x_test, y, target_object,_list_col_x, false);	
	if (_num == 0) {
		show_debug_message("No X Collision");
	}
	
	if (_num > 0) {
		x_delta = scr_get_delta_axis(_num, _list_col_x, "horiz", x_test, y_test);
		x_new = x_delta[?"x_new"];
		y_new = y_test;
		dx = x_delta[?"dx"];
		dy = x_delta[?"dy"];
		results[?"horiz_collide"] = true;
	}
	
	// Check vert collisions second
	var _list_col_y = ds_list_create();
	var _num = instance_place_list(x_new, y_test, target_object,_list_col_y, false);	
	if (_num == 0) {
		show_debug_message("No Y Collision");
	}
	if (_num > 0) {
		y_delta = scr_get_delta_axis(_num, _list_col_y, "vert", x_new, y_test);
		x_new = y_delta[?"x_new"];
		y_new = y_delta[?"y_new"];
		dx = y_delta[?"dx"];
		dy = y_delta[?"dy"];
		results[?"vert_collide"] = true;
	}
	
	// Create Map to store results of collision check
	results[?"x_new"] = x_new;
	results[?"y_new"] = y_new;
	results[?"dx"] = dx;
	results[?"dy"] = dy;
}