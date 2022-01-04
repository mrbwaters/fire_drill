// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_obj_collisions(test_x, test_y, obj_list){
	// Create result dictionary
	result = ds_map_create();
	// Loop through each object
	for (idx = 0; idx < array_length(obj_list); idx++) {
		// Store object name as variable
		obj_name =  string(object_get_name(obj_list[idx]));
		// Store result of collision check to result dictionary
		result[? obj_name] = place_meeting(test_x, test_y, obj_list[idx]);
	}	
	return result;
}