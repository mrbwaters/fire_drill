if distance_to_object(obj_pc) >= 10 {
	talking = false;
	if page != 0 then page = 0;
} else if meta_game.key_action {
	if talking = false then talking = true;
	else {
		if page < (array_length(dialog) - 1) then page++;
		else {
			talking = false;
			page = 0;
		}	
	}
}