// Get input
scr_get_input();

// Physics
// Forward movement
hspd = (key_right - key_left) * run_spd;

if (hspd > 0 or hspd < 0){
	state		= states.run;
}

if (key_jump & on_ground) {
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	vspd		-= jump_spd;
	on_ground	= false;
	t_jump		= current_time;
	state		= states.jump;
}

if (state != 0) show_debug_message("DEBUG STATE >>>>> " + string(state));

switch (state){
	case states.idle:	scr_player_idle();	break;
	case states.run:	scr_player_run();	break;
	case states.jump:	scr_player_jump();	break;
	case states.fall:	scr_player_fall();	break;
}