// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_jump(){
	// Start fall after some time
	if (current_time > t_jump + t_float)	 {
		state = states.fall;
	}
	else {			
		state = states.jump;
	}
	move_and_collide();
}