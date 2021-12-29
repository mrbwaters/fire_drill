function scr_get_input() {
	//GAME
	key_quit			= keyboard_check_pressed(vk_escape);
	key_restart			= keyboard_check_pressed(vk_f5);
	key_test			= keyboard_check_pressed(vk_backspace);
						
	//MOVE				
	key_left			= keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right			= keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_up				= keyboard_check(vk_up) or keyboard_check(ord("W"));
	key_down			= keyboard_check(vk_down) or keyboard_check(ord("S"));
	key_space			= keyboard_check(vk_space); 
	key_jump			= keyboard_check_pressed(vk_space);
	
	//Numbers
	key_1				= keyboard_check_pressed(ord("1"));
	key_2				= keyboard_check_pressed(ord("2"));
	key_3				= keyboard_check_pressed(ord("3"));
	key_4				= keyboard_check_pressed(ord("4"));
	key_5				= keyboard_check_pressed(ord("5"));
	key_6				= keyboard_check_pressed(ord("6"));
	key_7				= keyboard_check_pressed(ord("7"));
	key_8				= keyboard_check_pressed(ord("8"));
	key_9				= keyboard_check_pressed(ord("9"));
	key_0				= keyboard_check_pressed(ord("0"));
	
	//Convert Input into variables used for movement
	horiz_input = key_right - key_left;
	vert_input = key_down-key_up;
	jump_input = key_jump;
}