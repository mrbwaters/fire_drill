// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_obj_collisions(obj_list){
	// Create result dictionary
	result = ds_map_create();
	
	// Loop through each object
	for (idx = 0; idx < array_length(obj_list); idx++) {
		temp = ds_map_create();
		obj_name =  string(object_get_name(obj_list[idx]));
		// show_debug_message("LIST >> " + obj_name);
		get_collision(obj_list[idx], temp);
		
		// Default value is no collision
		result[? obj_name] = false;
		
		// Add collision to the result object
		if (!is_undefined(temp)) {
			// show_debug_message("DEBUG surround >>> vert check >> " + string(temp[?"vert_collide"]) + " horiz check >> " + string(temp[?"horiz_collide"]));
			if (temp[?"vert_collide"] == true or temp[?"horiz_collide"] == true) {
				result[? obj_name] = true;
			}
		}
	}
	
	return result;
}