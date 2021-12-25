// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_jump(){
<<<<<<< Updated upstream
	// Start fall after some time
	if (current_time > t_jump + t_float)	 {
		state = states.fall;
	}
	else {			
		state = states.jump;
	}
=======
	// If player collides with object begin to fall
//	if (vspd == 0) state = states.fall;
	
	obj_player.vspd += jspd;
>>>>>>> Stashed changes
	move_and_collide();
	
	// Jump then float for t_float duration and then being fall
	t_jump = current_time;
	state = states.glide;
}