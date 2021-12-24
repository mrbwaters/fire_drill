// Get input
scr_get_input();
vspd = vspd;

// Physics
// Horizontal movement
hspd = (key_right - key_left) * run_spd;

if (hspd > 0 or hspd < 0){
	state = states.run;
}

// Jump ToDo fix how this works
if (key_jump & on_ground) { 
	vspd += -jspd;
	audio_play_sound(sfx_hit1_C2_dry,4,false)
	on_ground = false;
	t_jump = current_time;
	state = states.jump;
}

// Apply Gravity and collisions

if keyboard_check(vk_space) {
	if (current_time > t_jump + t_float)	 {
		apply_gravity();
		}
	}
else{			
	apply_gravity()
	}
	
switch (state){
	case states.idle: vspd = 0; hspd = 0; apply_gravity(); move_and_collide(); break;
	case states.run: apply_gravity(); move_and_collide(); break;
	case states.jump: state = states.idle; break;
}