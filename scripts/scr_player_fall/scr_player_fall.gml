// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_fall(){
	/*
	Description
		Arbitrary downward vertical movement (gravity)
		Should support player input to be converted into horizontal movement that is not the Run state
	Transition to pc_states
		Idle - a player should enter into an idle state after vertical movement has reached 0 (you can have collision with wall object but still be falling like a mis-timed jump)
		Climb - after a collision with a ladder object a player should be able to enter the climb state even if that is from a fall
		Death - after collision with spikes pc should enter dead state
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Pause

	*/
	// Always do prior_state checks before setting the prior_state

	sprite_index = spr_pc;
	apply_facing();
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for movement
	apply_gravity();
	hspd = v_run * horiz_input;
	
	// Transition to pc_states
	// Return to idle after a fall
	if (coords[?"vert_collide"] == true and coords[?"dy"] > 0) {
		if (horiz_input != 0) {
			vspd = 0;
			state = pc_states.run;
		}
		else state = pc_states.idle;
		sfx_play("Land");
	}
	
	// Return to idle after a fall onto a moving platform
	if (place_meeting(x,y, obj_platform_move)) {
		state = pc_states.idle;
		sfx_play("Land")
	}
	
	// If collide with ladder and key pressed is UP Change to Climb
	if (place_meeting(x,y,obj_ladder) and vert_input != 0) {
		state = pc_states.climb;	
	}

	// Change to death state
	if (instance_place(x, y, meta_damage)) {
		state = pc_states.death;
	}
	
	// Falling death
	if ((place_meeting(x,y+8,obj_wall) or place_meeting(x,y+8,obj_ladder) or place_meeting(x,y+8,obj_platform_move)) and coords[?"dy"] > 0 and (y - apogee) > fall_dead) {
		state =  pc_states.death;
	}
}