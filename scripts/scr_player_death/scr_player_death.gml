// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_death(){
	// Always do prior_state checks before setting the prior_state
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for movement
	vspd = 0;
	hspd = 0;
	
	// Carry out death actions here
	player_death();
	state = states.idle;
}