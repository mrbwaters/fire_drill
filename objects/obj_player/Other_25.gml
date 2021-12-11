/// @desc Methods

init_sprites = function() {
	var _i = 0; repeat (argument_count div 2) {
		var _default = asset_get_index("sPlayer" + argument[_i+1]);
		if (_default == -1) _default = sPlayerIdle;
		
		sprites[$ argument[_i]] = [_default];
		_i += 2;
	}
};

get_sprite = function() {
	return sprites[$ fsm.get_current_state()][0];
};

check_input = function() {
	with (input) {
		hdir	= max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
				  max(keyboard_check(ord("A")), keyboard_check(vk_left));
		jump	= max(keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_up));
		//attack	= max(keyboard_check_pressed(ord("Z")), keyboard_check_pressed(vk_space));
	}
};

on_ground = function() {
	return (place_meeting(x, y+1, obj_wall));	
};

apply_gravity = function() {
	vspd = min(vspd+grav, vspdMax);
};

move_and_collide = function() {
    //Pit Death
	if (place_meeting(x, y, meta_pit)) fsm.change("dead");
	
	//Win Game
	if (place_meeting(x, y, obj_goal)) fsm.change("win");
	
	//Movement and Obstacles
	if (place_meeting(x+hspd, y, obj_wall)) {
		while (!place_meeting(x+sign(hspd), y, obj_wall)) x += sign(hspd);
		hspd = 0;
	}
	x += hspd
	if (place_meeting(x, y+vspd, obj_wall)) {
		while (!place_meeting(x, y+sign(vspd), obj_wall)) y += sign(vspd);
		vspd = 0;
	}
	y += vspd;
	

	
};