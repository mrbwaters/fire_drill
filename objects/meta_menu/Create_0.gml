grid_scale		= meta_game.grid_scale;
color			= c_white;
				
highlight		= 0;

init_buttonx	= 3 * grid_scale;
init_buttony	= 5 * grid_scale;

TEXT	= 0;
ACTION	= 1;

if meta_game.game_begin == true then resume = "Begin the climb";
else resume = "Resume";

if meta_game.mute then sound = "Unmute";
else sound = "Mute";

button_array[0, TEXT]	= resume;
button_array[0, ACTION] = fn_resume;
button_array[1, TEXT]	= sound;
button_array[1, ACTION] = fn_mute;
button_array[2, TEXT]	= "Quit";
button_array[2, ACTION] = game_end;

can_move = true;