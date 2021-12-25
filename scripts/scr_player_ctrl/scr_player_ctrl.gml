// These functions are used in obj_player Step event.

// Get User Input
function get_player_input() {
horiz_input = key_right - key_left;
jump_input = key_jump;
}

// Apply User Input
function apply_player_input() {
// Phsyics
// Forward movement
hspd = hspd_max * horiz_input;

// Enter jump state if player is on the ground and jump key is pressed
	if (jump_input & on_ground) {
		vspd += -jspd_max;
		audio_play_sound(sfx_hit1_C2_dry,4,false)
		on_ground=false;
		t_jump = current_time;
		state = states.jump;
	}
}

// Apply logic to update player state
function update_player_state() {
// Enter run state when moving left or right

if (state==states.idle) {
	if (hspd > 0 or hspd < 0){
		state = states.run;
	}
}

// Enter fall state when gravity is applied (i.e. falling off a ledge)
if (vspd > 0) {
	state = states.fall;
}

// Return to idle if at any time vspd and hspd are 0
if (vspd == 0 and hspd == 0){
	state = states.idle;
}

// State updates based on initial state:

if (state==states.jump) {
	
	if (vspd == 0) state = states.fall;
	
	if (!keyboard_check(vk_space)) state = states.fall;
	
	// Jump for the t_float duration and then being fall
	if (current_time > t_jump + t_float) state = states.fall;
}


if (state==states.fall) {
	if (vspd == 0 & hspd == 0) {state = states.idle}; 
	if (vspd==0 & hspd!=0) {state=states.run};
}

if (state != 0) show_debug_message("DEBUG STATE >>>>> " + string(state));	
}

// Apply physics based on player state
function apply_player_state() {
switch (state){
	case states.idle: scr_player_idle(); break;
	case states.run: scr_player_run(); break;
	case states.jump: scr_player_jump(); break;
	case states.fall: scr_player_fall(); break;
	}
}
	
function apply_exit_game() {
	game_end();
}