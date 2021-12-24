// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){	
	
	hspd_old=hspd;
	vspd_old=vspd;
	
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
		if (!on_ground) {
			on_ground=true;
			audio_play_sound(sfx_thud1_C2_dry,4,false);
			create_landing_dust();
		}
	}
	y += vspd;
	
	
	if (sign(hspd) != sign(hspd_old)){
		create_horiz_dust(sign(hspd));
	}
	
}