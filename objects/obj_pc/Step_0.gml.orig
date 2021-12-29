// Get input
hspd = max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
       max(keyboard_check(ord("A")), keyboard_check(vk_left));

vspd = vspd;

jump = keyboard_check_pressed(vk_space);

// Phsyics
// Forward movement
hspd = 8 * hspd;

if (hspd > 0 or hspd < 0){
	state = states.run;
}

if (jump & on_ground) {
	vspd += -jspd;
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	on_ground=false;
	t_jump=current_time;
	state = states.jump;
}

show_debug_message("DEBUG >>>>> " + string(state));

switch (state){
	case states.idle: scr_player_idle(); break;
	case states.run: scr_player_run(); break;
	case states.jump: scr_player_jump(); break;
	case states.fall: scr_player_fall(); break;
}
