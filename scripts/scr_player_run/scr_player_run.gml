// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
<<<<<<< Updated upstream
	if (on_ground) {
		apply_gravity();
		move_and_collide();
	}
	// Jumping and running in air
	else {
		state = states.jump;
		move_and_collide();
	}
=======
	// Reset player to idle when stopped running
	if (hspd == 0 and on_ground) state = states.idle;
	
	// Begin to fall if walks horizontally off ledge
	if (vspd<0) state=states.fall;
	
	apply_gravity()
	move_and_collide();
>>>>>>> Stashed changes
}