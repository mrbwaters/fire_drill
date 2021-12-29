
scr_player_step();

if (room != init_room) {
	x_start = obj_pc.x;
	y_start = obj_pc.y;
	init_room=room;
}