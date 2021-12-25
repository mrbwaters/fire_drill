// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){	
	
<<<<<<< Updated upstream
	hspd_old=hspd;
	vspd_old=vspd;
	
	// Check for collisions with wall objects
	horizontal_collision =  place_meeting(round(x+hspd),round(y), meta_obj_wall)
	vertical_collision = place_meeting(round(x),round(y+vspd), meta_obj_wall)
=======
	dx=hspd * delta_time/1000000;
	dy=vspd * delta_time/1000000;
	
	// Check for collisions with wall objects
	horizontal_collision =  place_meeting(round(x+dx),round(y), obj_wall)
	vertical_collision = place_meeting(round(x),round(y+dy), obj_wall)
>>>>>>> Stashed changes
	
	if (horizontal_collision)
	{
		while (!horizontal_collision) x += sign(hspd); // can this ever run???
		hspd = 0;
		
	}
	dx=hspd * delta_time/1000000;
	x += dx;
	
	if (vertical_collision)
	{
		while (!vertical_collision) y += sign(vspd);
		vspd = 0;
		if (!on_ground) {
			on_ground=true;
<<<<<<< Updated upstream
			audio_play_sound(sfx_thud1_C2_dry,4,false);
			create_landing_dust();
		}
	}
	y += vspd;
	
	
	if (sign(hspd) != sign(hspd_old)){
		create_horiz_dust(sign(hspd));
	}
=======
			play_sfx(sfx_land);
		vfx_part_landing();
		}
	}

	dy=vspd * delta_time/1000000;
	vspd = min(vspd, vspdMax);
	vspd = max(vspd, vspdMin);
	y += dy;
	

>>>>>>> Stashed changes
	
}