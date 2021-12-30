// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_step(){
	// Handle User Input
	scr_get_input();

	// Enter the state machine
	apply_player_state();
	
	/* Apply the input and variables set by the given state function
	   scr_apply_movement()
	      move()
	      collide()
	      ??apply_gravity() not sure when where to do this yet??
	*/
	coords = move_collide_and_grav();

	// Print Debug Messages
	print_debug_step();

}