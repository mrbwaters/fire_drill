
function scr_game_step(){
	// Handle player input
	scr_get_input();
	
	// Enter the state machine
	apply_game_state();
	
	// Check BGM mute conditions
	bgm_step();
}