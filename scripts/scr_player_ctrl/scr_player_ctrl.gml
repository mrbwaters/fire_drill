// These functions are used in obj_pc Step event.
// Apply physics based on player state
function apply_player_state() {
	switch (state){
		case pc_states.idle: scr_player_idle(); break;
		case pc_states.run: scr_player_run(); break;
		case pc_states.jump: scr_player_jump(); break;
		case pc_states.fall: scr_player_fall(); break;
		case pc_states.climb: scr_player_climb(); break;
		case pc_states.death: scr_player_death(); break;
	}
}
	
function print_debug_console() {
	if (state != 0) show_debug_message("DEBUG: STATE >>> " + string(state) + "  PRIOR STATE >>> " + string(prior_state));	
}

function player_death() {
	sprite_index = spr_pc_death;
	meta_game.blackout = true; // Fade out and change room.
	sfx_play("Death");
	//bgm_stop();
}

function apply_facing() {
	switch facing {
		case "Left": sprite_index=spr_pc_L; break
		case "Right": sprite_index=spr_pc_R; break
		}
}