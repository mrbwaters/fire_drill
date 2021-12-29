if distance_to_object(obj_pc) >= 10 then talking = false;

if distance_to_object(obj_pc) < 10 && meta_game.key_action {
	talking = true;
}