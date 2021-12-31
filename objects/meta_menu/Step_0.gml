if meta_game.mute then sound = "Unmute";
else sound = "Mute";
button_array[1, TEXT]	= sound;

if meta_game.key_down_pressed {
	highlight++;
	// PLAY SOUND EFFECT
}
if highlight >= array_length(button_array) then highlight = 0;

if meta_game.key_up_pressed {
	highlight--;
	// PLAY SOUND EFFECT
}
if highlight < 0 then highlight = array_length(button_array) - 1;

if meta_game.key_action || meta_game.key_start then script_execute(button_array[highlight, ACTION]);