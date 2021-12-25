// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Get input
function scr_player_ctrl(_obj) {
apply_input(_obj)
state_update(_obj);
state_action(_obj);
}

// Get and apply user input.
function apply_input(_obj) {
h_input = max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
	max(keyboard_check(ord("A")), keyboard_check(vk_left));

jump_input = keyboard_check_pressed(vk_space);

_obj.hspd = 8 * h_input;

}
	
	
// Check player condition and update state flag
function state_update(_obj){
// Enter run state when moving left or right
if (_obj.hspd > 0 or _obj.hspd < 0){
	_obj.state = states.run;
}

// Enter fall state when gravity is applied (i.e. falling off a ledge)
if (_obj.vspd > 0) {
	_obj.state = states.fall;
}

// Return to idle if at any time vspd and hspd are 0
if (_obj.vspd == 0 and _obj.hspd == 0){
	_obj.state = states.idle;
}

// Enter jump state if player is on the ground and jump key is pressed
if (jump_input & _obj.on_ground) {
	_obj.vspd += jspd;
	play_sfx(sfx_jump);
	_obj.on_ground=false;
	_obj.t_jump = current_time;
	_obj.state = states.jump;
}


if (_obj.vspd < 0) {
 	_obj.state = states.glide;
}

if (_obj.state != 0) show_debug_message("DEBUG STATE >>>>> " + string(_obj.state));
}
	
// Apply physics based on state flag
function state_action(_obj) {
switch (_obj.state){
	case states.idle: scr_player_idle(); break;
	case states.run:  scr_player_run(); break;
	case states.jump: scr_player_jump(); break;
	case states.fall: scr_player_fall(); break;
	case states.glide: scr_player_glide(); break;
	
	// catch if state not set correctly
	show_debug_message(">>>State Not Set<<<")
	move_and_collide();
	}
}