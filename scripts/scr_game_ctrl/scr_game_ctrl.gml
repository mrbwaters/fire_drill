
function apply_game_state() {
	switch(state) {
		case game_states.start:		scr_game_start();	break;
		case game_states.menu:		scr_game_menu();	break;
		case game_states.levels:	scr_game_levels();	break;
		case game_states.pause:		scr_game_pause();	break;
		case game_states.death:		scr_game_death();	break;
	}
}

function scr_game_start() {
	title_counter++;
	if (title_counter > 3 * room_speed) || (key_action || key_start) {
		title_card = false;
		room_goto(rm_menu);
		state = game_states.menu;
	}
}

function scr_game_menu() {
	//MENU STUFF GOES HERE	
}

function scr_game_levels() {
	if (key_menu || key_start) {
		state = game_states.pause;
	}
}

function scr_game_pause() {
	game_begin = false;
	next_room = room;
	room_persistent = true;
	room_goto(rm_menu);
	state = game_states.menu;
}

function scr_game_death() {
	//DEATH STUFF GOES HERE	
}

function fn_resume() {
	room_goto(meta_game.next_room);
	meta_game.state = game_states.levels;
}

function fn_mute() {
	meta_game.mute = !meta_game.mute;
}