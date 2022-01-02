// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_jump(){
	/*
	Description
		Convert player input to vertical movement
		This state should be considered the arbitrary upward airborne movement (opposite to fall)
		This should support horizontal movement supplied by user input (this is distinct from the Run state)
	Transition to states
		Fall - this should be the only state Jump can trigger
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Pause
	*/
	
	// Change horizontal speed if user input is received for LEFT and RIGHT
	hspd = v_run * horiz_input
	
	// Always do prior_state checks before setting the prior_state
	
	// Apply values to key movement variables make sure not to double jump
	if (prior_state != states.jump) {
		vspd += -jspd_max;
		
		// Sound and animation
		sfx_play("Jump");
		sprite_index = spr_pc_jump;
		
		
	}
    
	// Fall after colliding with a wall during a jump
    if (prior_state == states.jump and coords[?"vert_collide"] == true) {
		state = states.fall;
		apogee =  y;
		sfx_play("Land");
	}

	// Save prior state after the prior state check
	prior_state = state;
	
	// Begin to fall after arbitrary time
	if (current_time > t_jump + t_float) {
		state = states.fall;
		apogee =  y;
	}
	
	// If collide with ladder and key pressed is UP Change to Climb
	if (place_meeting(x,y,obj_ladder) and vert_input < 0) {
		state = states.climb;	
	}
}