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
	// Always do prior_state checks before setting the prior_state
	
	//Change to idle at bottom of ladder
	if (coords[?"dy"] != 0 and vspd > 0 and prior_state = states.climb) {
		state = states.idle;
	}
	
	//Change to idle at top of ladder
	if (coords[?"dy"] == 0 and vspd < 0 and prior_state = states.climb and !place_meeting(x,y, obj_ladder)) {
		vspd = 0;
		state = states.idle;
	}
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for movement in the climb state
	hspd = 0;
	vspd = v_climb * vert_input;
	
	// Nudge player towards center of ladder
	var _ladder = instance_place(x,y,obj_ladder)
	var tol=1 / meta_game.grid_scale;
	
	if _ladder != noone {
		dx_sprite = ceil(meta_game.grid_scale - sprite_width)/2;
		if (abs(x/meta_game.grid_scale - dx_sprite/meta_game.grid_scale - _ladder.x/meta_game.grid_scale) > tol) {
			hspd = - sign(x/meta_game.grid_scale - round(_ladder.x/meta_game.grid_scale)) * 1.5 * tol;
			}
		if (abs(x/meta_game.grid_scale - dx_sprite/meta_game.grid_scale - _ladder.x/meta_game.grid_scale) <= tol) {
			x=_ladder.x + dx_sprite;
			}
		}
	
	// Transition to states
	// Change state to Jump
	if (jump_input != 0) {
		// Start the jump timer here
		t_jump = current_time;
		state = states.jump;	
	}
}