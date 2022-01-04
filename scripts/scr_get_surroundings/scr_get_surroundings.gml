// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_surroundings(){
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
	x_const = 8;
	y_const = 1;
	test_x = x;
	test_y = y;

	// Create list of objects to check
	collidables =  [obj_wall, obj_ladder, obj_platform_move];
	
	// Loop through each position
	for (var key = ds_map_find_first(results); !is_undefined(key); key = ds_map_find_next(results, key)) {
		// Check top
		if (key == "top") {
			// Set x and y and modify the variable based on the grid position
			test_y = y - y_const;
		}
		// Check all other locations
		if (key == "top_left") {
			// Top vert change
			test_y = y - y_const;
			// Left horiz change
			test_x = x + x_const;
		}

		if (key == "top_right") {
			// Top vert change
			test_y = y - y_const;
			// Right horiz change
			test_x = x + x_const;
		}
		if (key == "right") {
			// Right horiz change
			test_x = x + y_const;
		}
		if (key == "bottom_right") {
			// Bottom vert change
			test_y = y + y_const;
			// Right horiz change
			test_x = x + x_const;
		}
		if (key == "bottom") {
			// Bottom vert change
			test_y = y + y_const;
		}
		if (key == "bottom_left") {
			// Bottom vert change
			test_y = y + y_const;
			// Left horiz change
			test_x = x - x_const;
		}
		if (key == "left") {
			// Left horiz change
			test_x = x - x_const;
		}
		// Assign collision results to dictionary object
		results[? key] = scr_get_obj_collisions(test_x, test_y, collidables);
		test_x = x;
		test_y = y;
	}
	return results;
}