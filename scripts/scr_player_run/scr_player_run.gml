// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
	/*
	Description
		User input is converted to horizontal movement
	Transition to pc_states
		Idle - if a player collides with an object they should stop running
		Climb - a player can enter climb state after a collision with a ladder
		Jump - a player can enter the Jump sate after a key press
		Fall - a player can enter the Fall state when vertical speed changes to a positive value (like when walking off a ledge or a ladder)
		Death - a pc should enter dead state after a left or right collision with an enemy
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Flag - player should be able to drop a flag while in run state
			Pause - player should be able to enter Pause from any state
	*/
	// Always do prior_state checks before setting the prior_state
	sprite_index = spr_pc;
	apply_facing();
	// Save prior state
	prior_state = state;
	
	// Get horizontal speed for movement when on top of bounding box for obj_wall and when vspd == 0
	// Local variable for moving platform logic
	moving_platform_id = instance_place(x,y+1, obj_platform_move);
	platform_hspd = 0;
	//Stay on moving platform - If on top bounding box of obj_platform_move then match hspd of target object
	if (moving_platform_id) {
		platform_hspd = variable_instance_get(moving_platform_id, "hspd");
		platform_vspd = variable_instance_get(moving_platform_id, "vspd");
		vspd = platform_vspd;
	} 
	hspd = platform_hspd + v_run * horiz_input;
	
	// Transisitons
	// If top of bounding box obj_wall and horiz_input == 0 Change state to Idle
	if (horiz_input == 0) {
		state = pc_states.idle;
	}
	
	// If collide with ladder and key pressed is UP Change to Climb
	if (place_meeting(x,y,obj_ladder) and vert_input < 0) {
		state = pc_states.climb;	
	}
	
	// Change state to Jump
	if (jump_input != 0) {
		// Start the jump timer here
		t_jump = current_time
		state = pc_states.jump;	
	}

	// Change to death state
	// Spike collision
	if (instance_place(x, y, meta_damage)) {
		state = pc_states.death;
	}

    if (!place_meeting(x,y+1,obj_wall) and !place_meeting(x,y+1,obj_ladder) and !place_meeting(x,y+1, obj_platform_move)) state = pc_states.fall; apogee=y; return;

	// Enemy collision
	// Wall squish
}