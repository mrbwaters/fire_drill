/// @desc Methods
function get_input(){
	//Additional state changes
	if (place_meeting(x + player_fsm.move_cfg.hspd, y, meta_goal)) player_fsm.move_cfg.fsm.change("win");
	if (place_meeting(x, y+ player_fsm.move_cfg.hspd, meta_pit)) player_fsm.move_cfg.fsm.change("dead");
	
	player_fsm.move_cfg.hdir	= max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
			          max(keyboard_check(ord("A")), keyboard_check(vk_left));
	player_fsm.move_cfg.vdir	= max(keyboard_check(ord("S")), keyboard_check(vk_down)) - 
					  max(keyboard_check(ord("W")), keyboard_check(vk_up));
}