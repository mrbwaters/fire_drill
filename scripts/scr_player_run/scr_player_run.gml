// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
	// Reset player to idle when stopped running
	if (hspd == 0 and on_ground) state = states.idle;
	
	// Begin to fall if jumps horizontally
	if (current_time > t_jump + t_float) apply_gravity();
	
	move_and_collide();
}