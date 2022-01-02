function scr_game_ctrl(){
	show_debug_message("GAME CONTROL FUNCTION GOES HERE");
}

function fn_resume() {
	room_goto(meta_game.next_room);
}

function fn_mute() {
	meta_game.mute = !meta_game.mute;
}