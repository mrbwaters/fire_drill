// These functions are used in obj_pc Step event.
// Apply physics based on player state
function apply_player_state() {
	switch (state){
		case states.idle: scr_player_idle(); break;
		case states.run: scr_player_run(); break;
		case states.jump: scr_player_jump(); break;
		case states.fall: scr_player_fall(); break;
		case states.climb: scr_player_climb(); break;
		case states.death: scr_player_death(); break;
	}
}
	
function apply_exit_game() {
	game_end();
}


function print_debug_console() {
	if (state != 0) show_debug_message("DEBUG: STATE >>> " + string(state) + "  PRIOR STATE >>> " + string(prior_state));	
}


function player_death() {
	x = x_start
	y = y_start	
}