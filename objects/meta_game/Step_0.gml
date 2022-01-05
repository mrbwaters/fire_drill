scr_game_step();



// Blackout
if blackout == true {
	if blackout_alpha < 1 {
	   blackout_alpha += 1 / blackout_fade_time; // alpha will reach 1 at set fade time
	   if blackout_alpha >= 1 {
			pcx = current_checkpoint_x;
			pcy = current_checkpoint_y;			
			if meta_game.current_checkpoint_room == room then room_restart();
			else room_goto(meta_game.current_checkpoint_room);
			
			blackout_alpha = 0;
			blackout = false;
	   }
	}
}