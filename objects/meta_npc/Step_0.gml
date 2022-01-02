if distance_to_object(obj_pc) >= (meta_game.grid_scale / 2) {
	talking = false;
	if PAGE != 0 then PAGE = 0;
} else {
	meta_game.tip = "Press " + meta_game.name_key_action + " to talk to " + name;
	meta_game.show_tip = true;
	
	if meta_game.key_action {
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
}

if talking == true then obj_pc.state = states.idle; // Disables PC action while talking