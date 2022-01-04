if !checked and meta_game.key_action {
	checked = true;
	switch(room) {
		case rm_1: meta_game.flag_rm_1 = true; break;
		case rm_2: meta_game.flag_rm_2 = true; break;
		case rm_3: meta_game.flag_rm_3 = true; break;
		case rm_4: meta_game.flag_rm_4 = true; break;
		case rm_5: meta_game.flag_rm_5 = true; break;
		case rm_6: meta_game.flag_rm_6 = true; break;
	}
	
	image_speed = 2;
	sfx_play("Menu_Select");
	
	// Record location of PC so that respawns here on death.
	meta_game.current_checkpoint_room = room;
	meta_game.current_checkpoint_x = x;
	meta_game.current_checkpoint_y = y;
}