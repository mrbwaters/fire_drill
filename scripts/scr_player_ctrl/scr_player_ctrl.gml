// These functions are used in obj_player Step event.

// Get User Input
function get_player_input() {
	horiz_input = key_right - key_left;
	vert_input = key_down-key_up;
	jump_input = key_jump;
}

// Apply User Input
function apply_player_input() {
	if on_ground vspd=0;
	
	hspd = v_run * horiz_input;

	// Enter jump state if player is on the ground and jump key is pressed
	if (jump_input & (on_ground | on_ladder)) {
		vspd += -jspd_max;
		audio_play_sound(sfx_hit1_C2_dry,4,false)
//		on_ground=false;
		t_jump = current_time;
		state = states.jump;
	}
}

// Apply logic to update player state
function update_player_state() {
	
	if(on_ground) state=states.idle;
	
	// Enter run state when moving left or right
	if (state==states.idle) {
		if (hspd > 0 or hspd < 0){
			state = states.run;
		}
	}

	if (state =states.climb) {
		vspd = v_climb * vert_input;
	}

	if (state==states.jump) {
	
		if (vspd == 0) state = states.fall;
	
		if (!keyboard_check(vk_space)) state = states.fall;
	
		// Jump for the t_float duration and then being fall
		if (current_time > t_jump + t_float) state = states.fall;
		
		if (on_ground) state = states.idle;
	}


	if (on_ladder & !keyboard_check(vk_space)) state = states.climb;
	
	if (state==states.climb) {
		if (!on_ladder) state=states.fall;
	}
	
	if (state==states.run) {
		if (!on_ground) state=states.fall;
	}
	
	if (state==states.idle) {
		if (!on_ground) state=states.fall;
	}
	
}

// Apply physics based on player state
function apply_player_state() {
	switch (state){
		case states.idle: scr_player_idle(); break;
		case states.run: scr_player_run(); break;
		case states.jump: scr_player_jump(); break;
		case states.fall: scr_player_fall(); break;
		case states.climb: scr_player_climb(); break;
	}
}
	
function apply_exit_game() {
	game_end();
}


function print_debug_console() {
	if (state != 0) show_debug_message("DEBUG: STATE >>> " + string(state) + "  ONLADDER >>> " + string(on_ladder));	
}
