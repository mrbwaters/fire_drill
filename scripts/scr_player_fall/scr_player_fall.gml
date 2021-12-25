// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_fall(){
	on_ground = false;
	apply_gravity();
	move_and_collide();
	
	// This might be bug here
	if (vspd != 0) state = states.fall;
}