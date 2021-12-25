<<<<<<< Updated upstream
// Get input
hspd = max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
       max(keyboard_check(ord("A")), keyboard_check(vk_left));

jump = keyboard_check_pressed(vk_space);

// Phsyics
// Forward movement
hspd = 8 * hspd;

// Enter run state when moving left or right
if (hspd > 0 or hspd < 0){
	state = states.run;
}

// Enter fall state when gravity is applied (i.e. falling off a ledge)
if (vspd > 0) {
	state = states.fall;
	
}

// Return to idle if at any time vspd and hspd are 0
if (vspd == 0 and hspd == 0){
	state = states.idle;
}

// Enter jump state if player is on the ground and jump key is pressed
if (jump & on_ground) {
	vspd += -jspd;
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	on_ground=false;
	t_jump = current_time;
	state = states.jump;
}

if (state != 0) show_debug_message("DEBUG STATE >>>>> " + string(state));

switch (state){
	case states.idle: scr_player_idle(); break;
	case states.run: scr_player_run(); break;
	case states.jump: scr_player_jump(); break;
	case states.fall: scr_player_fall(); break;
}
=======
scr_player_ctrl(self);
>>>>>>> Stashed changes
