// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
	/*
	Description
		User input is converted to horizontal movement
	Transition to states
		Idle - if a player collides with an object they should stop running
		Climb - a player can enter climb state after a collision with a ladder
		Jump - a player can enter the Jump sate after a key press
		Fall - a player can enter the Fall state when vertical speed changes to a positive value (like when walking off a ledge or a ladder)
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Flag - player should be able to drop a flag while in run state
			Pause - player should be able to enter Pause from any state
	*/
	// Always do prior_state checks before setting the prior_state
	
	// Save prior state
	prior_state = state;
	
	// Get horizontal speed for movement when on top of bounding box for obj_wall and when vspd == 0
	// Add logic here 
	hspd = v_run * horiz_input;
	
	// Transisitons
	// If top of bounding box obj_wall and horiz_input == 0 Change state to Idle
	if (horiz_input == 0) {
		state = states.idle;
	}
	
	// If collide with ladder and key pressed is UP Change to Climb
	if (place_meeting(x,y,obj_ladder) and vert_input < 0) {
		state = states.climb;	
	}
	
	// Change state to Jump
	if (jump_input != 0) {
		// Start the jump timer here
		t_jump = current_time
		state = states.jump;	
	}
	
	// When not on top of something Change state to Fall
	if (vspd > 0) {
		state = states.fall;
	}
}