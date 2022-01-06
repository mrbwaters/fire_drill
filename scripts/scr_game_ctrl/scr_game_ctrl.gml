
function apply_game_state() {
	switch(state) {
		case game_states.start:		scr_game_start();	break;
		case game_states.menu:		scr_game_menu();	break;
		case game_states.levels:	scr_game_levels();	break;
		case game_states.pause:		scr_game_pause();	break;
		case game_states.death:		scr_game_death();	break;
		case game_states.win:		scr_game_win();		break;
	}
}

function scr_game_start() {
	title_counter++;
	if (title_counter > title_duration * room_speed) || (key_action || key_start) {
		title_card = false;
		room_goto(rm_menu);
		state = game_states.menu;
	}
}

function scr_game_menu() {
	//MENU STUFF GOES HERE	
}

function scr_game_levels() {
	room_persistent = false;
	
	// go to pause state
	if (key_menu || key_start) {
		state = game_states.pause;
	}
	
	// go to death state
	if obj_pc.state == pc_states.death {
		state = game_states.death;
	}
}

function scr_game_pause() {
	game_begin = false;
	next_room = room;
	room_persistent = true;
	room_goto(rm_menu);
	bgm_play();
	state = game_states.menu;
}

function scr_game_death() {
	blackout = true;
	if blackout_alpha < 1 {
		blackout_alpha += 1 / blackout_fade_time; // alpha will reach 1 at set fade time
		if blackout_alpha >= 1 {
			// Respawn
			pcx = current_checkpoint_x;
			pcy = current_checkpoint_y;	
				
			if meta_game.current_checkpoint_room == room then room_restart();
			else room_goto(meta_game.current_checkpoint_room);
			state = game_states.levels;
			
			// Reset blackout
			blackout_alpha = 0;
			blackout = false;
		}
	}	
}

function scr_game_win() {
	// WIN LOGIC HERE	
}

function fn_resume() {
	room_goto(meta_game.next_room);
	meta_game.state = game_states.levels;
}

function fn_mute() {
	meta_game.mute = !meta_game.mute;
}