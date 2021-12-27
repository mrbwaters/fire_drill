// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){
tol = meta_game.grid_scale/10;

x_test= x + hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
y_test= y + hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;

// Check Collisions		
var _inst = instance_place(x_test, y_test, meta_collision);
	
	if (_inst == noone) {
		x_new = x_test;
		y_new = y_test;
	}
	
	if (_inst != noone)
	{
		dx = _inst.x - x;
		dy = _inst.y - y;
		if (dx<dy) {
			x_new = _inst.x - meta_game.grid_scale;
			y_new = y_test;
		}
		if (dx>dy) {
			x_new = x_test;
			y_new = _inst.y - meta_game.grid_scale;
		}
		
		if (dx==dy) {
			x_new = _inst.x - meta_game.grid_scale;
			y_new = _inst.y - meta_game.grid_scale;
		}
	}

	on_ground = false
	on_ground = collision_line(x_new - meta_game.grid_scale/2 ,y_new + meta_game.grid_scale/2 + tol, x_new + meta_game.grid_scale/2 , y_new + meta_game.grid_scale/2 + tol, meta_collision, false, true) != 0;
	
	on_ladder = false;
	on_ladder = place_meeting(x_new,y_new, obj_ladder);
	
	x=x_new;
	y=y_new;
}