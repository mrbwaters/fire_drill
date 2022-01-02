
scr_player_step();

if (room != init_room) {
	x_start = obj_pc.x;
	y_start = obj_pc.y;
	init_room=room;
}

if distance_to_object(meta_npc) < (meta_game.grid_scale / 2) {
	var target = instance_nearest(x, y, meta_npc);
		meta_game.tip = "Press " + meta_game.name_key_action + " to talk to " + target.name;
		meta_game.show_tip = true;
	if target.talking then meta_game.show_tip = false;
} else meta_game.show_tip = false;