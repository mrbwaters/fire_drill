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

if meta_game.key_action then script_execute(button_array[highlight, ACTION]);