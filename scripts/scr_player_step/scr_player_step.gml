// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_step(){
	// Handle User Input
	scr_get_input();
	if horiz_input>0 facing = "Right";
	if horiz_input<0 facing = "Left";
	
	// Get surroundings before player state is updated
	nearby = ds_map_create();
	nearby = scr_get_surroundings();
	
	// Enter the state machine
	apply_player_state();
	
	// Check collisions and store results
	get_collision(meta_collision, coords);

	// Apply the movement
	x=coords[?"x_new"];
	y=coords[?"y_new"]

	// Check distance to npcs
	if distance_to_object(meta_npc) < (meta_game.grid_scale / 2) {
		var target = instance_nearest(x, y, meta_npc);
			meta_game.tip = "Press " + meta_game.name_key_action + " to talk to " + target.name;
			meta_game.show_tip = true;
		if target.talking then meta_game.show_tip = false;
	} else meta_game.show_tip = false;

	// Print Debug Messages
	print_debug_step();

}