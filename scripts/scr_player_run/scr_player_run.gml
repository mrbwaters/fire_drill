// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
	if (on_ground) {
		apply_gravity();
		move_and_collide();
	}
	// Jumping and running in air
	else {
		state = states.jump;
		move_and_collide();
	}
}