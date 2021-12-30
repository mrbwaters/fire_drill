if destination != noone {
	meta_game.pcx = other.x;
	if top_of_room then meta_game.pcy = 224;
	else meta_game.pcy = 16;
	room_goto(destination);
}