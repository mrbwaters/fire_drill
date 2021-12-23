// Get input
hspd = max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
       max(keyboard_check(ord("A")), keyboard_check(vk_left));

vspd = max(keyboard_check(ord("S")), keyboard_check(vk_down)) - 
	   max(keyboard_check(ord("W")), keyboard_check(vk_up));

jump = keyboard_check_pressed(vk_space);

// Phsyics
// Forward movement
hspd = 4 * hspd;

// Jump ToDo fix how this works
if (jump) { 
	vspd += -jspd;
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	on_ground=false;
}

// Apply Gravity and collisions
apply_gravity(self);
move_and_collide(self);