// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_surroundings(){
	original_hspd = hspd;
	original_vspd = vspd;
	
	// Create results dictionary
	results = ds_map_create();
	results[?"top_left"] = ds_map_create();
	results[?"top"] = ds_map_create();
	results[?"top_right"] = ds_map_create();
	results[?"right"] = ds_map_create();
	results[?"bottom_right"] = ds_map_create();
	results[?"bottom"] = ds_map_create();
	results[?"bottom_left"] = ds_map_create();
	results[?"left"] = ds_map_create();
	
	// Size of distance to look ahead for collisions
	const = 1;

	// Create list of objects to check
	collidables =  [obj_wall, obj_ladder, obj_platform_move];
	
	// Loop through each position
	var size, key, i, 
	size = ds_map_size(results);
	key = ds_map_find_first(results);
	for (i = 0; i < size; i++;){
	   // Check top
	   if (key == "top") {
		   // Set hspd and vspd and modify the variable based on the grid position
		   vspd -= const;
		   
		   // Loop through the objects and return the collisions for each object and store in proper result key
		   results[?"top"] = scr_get_obj_collisions(collidables);
	   
		   // Change speeds back to original values
		   vspd = original_vspd
		   // Get the next key in the dictionary
		   key = ds_map_find_next(results, key);
	   }
	   
	}
	
	//ToDo add logic for all positions
	
	return results;
}