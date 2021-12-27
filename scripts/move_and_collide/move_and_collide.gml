// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){
var tol = meta_game.grid_scale/100;

var x_test = x + hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
var y_test = y + vspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;

var x_new = x_test;
var y_new = y_test;
		
// Check Collisions		
var _list_col_x= ds_list_create();
var _num = instance_place_list(x_test, y, meta_collision,_list_col_x, false);	
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
	
	// check vert collisions
	var _list_col_y = ds_list_create();
	var _num = instance_place_list(x_new, y_test, meta_collision,_list_col_y, false);	
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
	
	on_ground = false
	on_ground = collision_line(x_new + tol,y_new + meta_game.grid_scale + 2 * tol, x_new + meta_game.grid_scale - tol, y_new + meta_game.grid_scale + 2 * tol, meta_collision, false, true);
	//on_ground = (on_ground!=0)
	
	on_ladder = false;
	on_ladder = place_meeting(x_new,y_new, obj_ladder);
	
	x=x_new;
	y=y_new;
}