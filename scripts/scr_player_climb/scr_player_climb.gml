// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_climb(){
	/*
	Description
		Convert player input to vertical movement up or down a ladder object
		Convert player up input to engage the ladder
		When player input is not received and collision with ladder stay in climb
	Transition to states
		Run - from Climb, a player should be able to move left and right
		Jump - from Climb, a player should be able to jump
		Idle - when not receiving player input and either at top or bottom of ladder
		Meta Actions - for simpler gameplay, idle might be the only state we want to be in to do other actions (except for Pause)
			Pause
	*/
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for movement in the climb state
	vspd = v_climb * vert_input;
	
	// Make sure to stay in same position while on the ladder when no input is received
	
	// Transition to states
	// Change state to run
	if (horiz_input != 0) {
		state = states.run;
	}

	// Change state to Jump
	if (jump_input != 0) {
		// Start the jump timer here
		t_jump = current_time;
		state = states.jump;	
	}
	
	// Change state to ide at top or bottom of ladder
}