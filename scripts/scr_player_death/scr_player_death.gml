
function scr_player_death(){
	// Always do prior_state checks before setting the prior_state
	
	// Save prior state
	prior_state = state;
	
	// Assign key variables for movement
	vspd = 0;
	hspd = 0;
	
	// Carry out death actions here
	sprite_index = spr_pc_death;
	
	player_death();
	state="Idle"
}