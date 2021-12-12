/// @desc Methods
check_input = function() {
	with (input) {
		hdir	= max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
				  max(keyboard_check(ord("A")), keyboard_check(vk_left));
		jump	= max(keyboard_check_pressed(ord("W")), keyboard_check_pressed(vk_up));
		//attack	= max(keyboard_check_pressed(ord("Z")), keyboard_check_pressed(vk_space));
	}
};

on_ground = function() {
	return (place_meeting(x, y+1, meta_wall));	
};

apply_gravity = function() {
	vspd = min(vspd+grav, vspdMax);
};

move_and_collide = function() {
    //Pit Death
	if (place_meeting(x, y, meta_pit)) fsm.change("dead");
	
	//Win Game
	if (place_meeting(x, y, meta_goal)) fsm.change("win");
	
	//Movement and Obstacles
	if (place_meeting(x+hspd, y, meta_wall)) {
		while (!place_meeting(x+sign(hspd), y, meta_wall)) x += sign(hspd);
		hspd = 0;
	}
	x += hspd
	if (place_meeting(x, y+vspd, meta_wall)) {
		while (!place_meeting(x, y+sign(vspd), meta_wall)) y += sign(vspd);
		vspd = 0;
	}
	y += vspd;
	

	
};