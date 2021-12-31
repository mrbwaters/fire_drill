color			= c_white;
				
highlight		= 0;

init_buttonx	= 112;
init_buttony	= 126;

TEXT	= 0;
ACTION	= 1;

if meta_game.game_begin = true then resume = "Start";
else resume = "Resume";

button_array[0, TEXT]	= resume;
button_array[0, ACTION] = fn_resume;
button_array[1, TEXT]	= "Quit";
button_array[1, ACTION] = game_end;