if distance_to_object(obj_pc) >= 10 {
	talking = false;
	if PAGE != 0 then PAGE = 0;
} else if meta_game.key_action {
	if talking = false then talking = true;
	else {
		if PAGE < (array_length(dialog[CONVERSATION]) - 1) then PAGE++;
		else {
			talking = false;
			PAGE = 0;
			if CONVERSATION < (array_length(dialog) - 1) then CONVERSATION++;
		}	
	}
}