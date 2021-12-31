function scr_get_input() {
	//GAME
	key_menu			= keyboard_check_pressed(vk_escape);
	key_restart			= keyboard_check_pressed(vk_f5);
	key_test			= keyboard_check_pressed(vk_backspace);
	key_start			= keyboard_check_pressed(vk_enter);
						
	//PC				
	key_left			= keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right			= keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_up				= keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_down			= keyboard_check(vk_down) or keyboard_check(ord("S"));
	key_up_pressed		= keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	key_down_pressed	= keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	key_jump			= keyboard_check_pressed(vk_space);
	
	key_action			= keyboard_check_pressed(ord("E"));
	
	//GAMEPAD
	var _dev = 0;
	if gamepad_is_connected(_dev) {
		var _deadzone = 0.3;
		key_left			= gamepad_axis_value(_dev, gp_axislh) < -_deadzone or
							gamepad_button_check(_dev, gp_padl) or key_left;
		key_right			= gamepad_axis_value(_dev, gp_axislh) > _deadzone or
							gamepad_button_check(_dev, gp_padr) or key_right;
		key_up				= gamepad_axis_value(_dev, gp_axislv) < -_deadzone or 
							gamepad_button_check(_dev, gp_padu) or key_up;
		key_down			= gamepad_axis_value(_dev, gp_axislv) > _deadzone or
							gamepad_button_check(_dev, gp_padd) or key_down;
		key_up_pressed		= gamepad_axis_value(_dev, gp_axislv) < -_deadzone or 
							gamepad_button_check_pressed(_dev, gp_padu) or key_up_pressed;
		key_down_pressed	= gamepad_axis_value(_dev, gp_axislv) > _deadzone or
							gamepad_button_check_pressed(_dev, gp_padd) or key_down_pressed;
		key_jump			= gamepad_button_check_pressed(_dev, gp_face1) or key_jump;
		key_action			= gamepad_button_check_pressed(_dev, gp_face3) or key_action;
		key_start			= gamepad_button_check_pressed(_dev, gp_start) or key_start;
	}
	
	//Convert Input into variables used for movement
	horiz_input = key_right - key_left;
	vert_input = key_down-key_up;
	jump_input = key_jump;
}