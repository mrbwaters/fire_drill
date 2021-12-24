// Get input
scr_get_input();

// Physics
// Horizontal movement
hsp = (key_right - key_left) * run_spd;

if (hsp > 0 or hsp < 0){
	state = states.run;
} else {
	state = states.idle;
}

// Jump ToDo fix how this works
if (key_jump & on_ground) { 
	vsp -= jspd;
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
	case states.idle: vsp = 0; hsp = 0; apply_gravity(); move_and_collide(); break;
	case states.run: apply_gravity(); move_and_collide(); break;
	case states.jump: state = states.idle; break;
}