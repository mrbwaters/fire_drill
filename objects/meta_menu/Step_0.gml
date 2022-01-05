if meta_game.mute then sound = "Unmute";
else sound = "Mute";
button_array[1, TEXT]	= sound;

if meta_game.key_down && can_move {
	can_move = false;
	highlight++;
	alarm[0] = 10;
	//sfx_play("Menu_Move");
}
if highlight >= array_length(button_array) then highlight = 0;

if meta_game.key_up && can_move {
	can_move = false;
	highlight--;
	alarm[0] = 10;
	//sfx_play("Menu_Move");
}
if highlight < 0 then highlight = array_length(button_array) - 1;

if (meta_game.key_action || meta_game.key_start) {
	script_execute(button_array[highlight, ACTION]);
	//sfx_play("Menu_Select");
}