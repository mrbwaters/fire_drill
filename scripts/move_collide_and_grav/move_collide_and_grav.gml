// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_collide_and_grav(){
	coords = get_collision(meta_collision);
	
    // TODO Apply Gravity Condition here or in idle
	//if (coords[?"dy"] == 0 and coords[?"dx"] == 0 and !place_meeting(x,y,obj_ladder) and state != states.jump) {
	//	apply_gravity();
	//}
	
	// Apply the movement maybe add some checks to prevent twitchy movement
	x=coords[?"x_new"];
	y=coords[?"y_new"];
	
	return coords;
}