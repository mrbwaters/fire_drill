if image_index = 0 and meta_game.key_action {
	image_speed = 6;
	sfx_play("Menu_Select")
	// Record location of PC so that respawns here on death.
	meta_game.pcx = x;
	meta_game.pcy = y;
}