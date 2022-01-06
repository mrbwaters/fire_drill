
function scr_player_death(){
	// Assign key variables for movement
	vspd = 0;
	hspd = 0;
	
	if (prior_state != pc_states.death) {	
		sprite_index = spr_pc_death;
		sfx_play("Death");
		bgm_stop();
	}
	
	// Save prior state
	prior_state = state;
}