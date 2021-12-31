// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_step(){
	// Handle User Input
	scr_get_input();

	// Enter the state machine
	apply_player_state();
	
	// Check collisions and store results
	get_collision(meta_collision, coords);

	// Apply the movement
	x=coords[?"x_new"];
	y=coords[?"y_new"]

	// Print Debug Messages
	print_debug_step();

}