// Get input
hspd = max(keyboard_check(ord("D")), keyboard_check(vk_right)) -
       max(keyboard_check(ord("A")), keyboard_check(vk_left));

vspd = vspd;

jump = keyboard_check_pressed(vk_space);

// Phsyics
// Forward movement
hspd = 8 * hspd;

// Jump ToDo fix how this works
if (jump & on_ground) { 
	vspd += -jspd;
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	on_ground=false;
	t_jump=current_time;
}

// Apply Gravity and collisions

if keyboard_check(vk_space) {
	if (current_time > t_jump + t_float)	 {
		apply_gravity(self);
		}
	}
else{			
	apply_gravity(self)
	}
	
move_and_collide(self);