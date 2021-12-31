// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_idle(){
	/*
	Description
		Do nothing
		Stay located in same position (like resting on ground or on a ladder the player does not move)
		If there is a collision on top of a moving obj, then match movement with moving box - this will also need to consider what happens if your on a moving box and then collide with a wall (obj_pc must get pushed off the moving obj)
		Apply gravity and collisions when in idle to be pushed off a moving object
		(To Be Handled in Climb state) If there is a collision with a ladder then do no apply gravity to maintain a static vertical position when no user input is supplied
	Transition to states
		Run - can run from idle state after user input is supplied
		Jump - can jump from idle state after user input is supplied
		Climb - can climb from idle state after a collision with ladder is made (either lader intesecting or lader below)
		Fall - this is triggered when you get pushed off a moving object and the player did not jump in time
	    Death - a pc should enter death state if squished into a wall by moving platform or collision left or right with enemy
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Talk - after a collision with NPC, idle state is triggered and then Talk state can be entered from key press
			Interact - after a collision with interactive object, idle state is triggered and then Interact state can be entered from key press
			Flag - after a run or fall, idle state is triggered and then player can enter Flag state from a key press
			Pause - any state should be able to trigger the Pause state
	*/
	// Always do prior_state checks before setting the prior_state
	
	// Get pushed off moving object Last state is idle and vspd > 0 Change state to Fall
	if (prior_state == states.idle and vspd > 0 and coords[?"dy"] != 0) {
		state = states.fall;
	}
	
	// TODO Fall from idle or apply gravity in move function
	//if (prior_state == states.idle and coords[?"dx"] == 0 and coords[?"dy"] == 0) {
	//	state = states.fall;
	//}
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for idle state
	hspd = 0;
	vspd = 0;
	
	// Local variable for moving platform logic
	moving_platform_id = instance_place(x,y+1, obj_platform_move);
	
	//Stay on moving platform - If on top bounding box of obj_platform_move then match hspd of target object
	if (moving_platform_id) {
		hspd = variable_instance_get(moving_platform_id, "hspd");
	} 

	// Transisitons
	// On top bounding box of obj_wall (logic for on_ground) then change state to Run
	if (horiz_input != 0) {
		state = states.run;
	}
	
	// Change state to Jump
	if (jump_input != 0) {
		// Reset hspd to 0 if on a moving platform and attempting to jump rather than carrying the momentum
		if (moving_platform_id) hspd = 0;
		
	// Start the jump timer here
		t_jump = current_time
		state = states.jump;	
	}
	
	// Collision with obj_ladder and input is up then Change state to Climb
	if (place_meeting(x,y, obj_ladder) and vert_input < 0 ) {
		state = states.climb;
	}
	
	// Obj_ladder below and input is vspd is down then Change state to Climb make sure not colliding with the ground
	if (place_meeting(x,y+3, obj_ladder) and vert_input > 0 and !place_meeting(x,y+1,obj_wall)) {
		state = states.climb;
	}
	
	
	// Walking off ladder or wall, change to fall.
	if (!place_meeting(x,y+1, obj_ladder) and !place_meeting(x,y+1, obj_wall) and !place_meeting(x,y+1, obj_platform_move)) {
		state = states.fall;
	}
	
	// Change to death state
	// Wall squish
	// Enemy collision
}