// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_delta_axis(obj_id, collision_list, axis, x_input, y_input){
	// Create results dictionary
	results = ds_map_create();
	
	for (var ii = 0; ii < obj_id; ++ii) {
		dx = collision_list[| ii].x - x;
		dy = collision_list[| ii].y - y;
		
		show_debug_message(">>> Collision  dx=" + string(dx) + " dy=" + string(dy));
		
		if (axis == "horiz") {
			// Modify x position based on collision
			if dx>0 {
				x_new = collision_list[| ii].x - sign(dx) * sprite_width;
			}
			if dx<0 {
				x_new = collision_list[| ii].x - sign(dx) * meta_game.grid_scale;
			}
			x_input = x_new;
		}
		
		if (axis == "vert") {
			y_new = collision_list[| ii].y - sign(dy) * (sprite_height);
			 // Modify y position based on collision
			if dy>0 {
				y_new = collision_list[| ii].y - sign(dy) * sprite_width;
			}
			if dy<0 {
				y_new = collision_list[| ii].y - sign(dy) * meta_game.grid_scale;
			}
			y_input = y_new;
		}
	}
	
	// Return Results
	results[?"x_new"] = x_input;
	results[?"dx"] = dx;
	results[?"y_new"] = y_input;
	results[?"dy"] = dy;
	return results;
}