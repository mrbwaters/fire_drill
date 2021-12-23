// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(target_object){
	// Get variables from object calling this function
	x = target_object.x;
	y = target_object.y;
	hspd = target_object.hspd;
	vspd = target_object.vspd;
	
	// Check for collisions with wall objects
	horizontal_collision =  place_meeting(round(x+hspd),round(y), meta_obj_wall)
	vertical_collision = place_meeting(round(x),round(y+vspd), meta_obj_wall)
	
	if (horizontal_collision)
	{
		while (!horizontal_collision) x += sign(hspd);
		hspd = 0;
		
	}
	x += hspd;
	
	if (vertical_collision)
	{
		while (!vertical_collision) y += sign(vspd);
		vspd = 0;
	}
	y += vspd;
}