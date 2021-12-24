// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){	
	// Check for collisions with wall objects
	horizontal_collision =  place_meeting(round(x+hspd),round(y), obj_wall)
	vertical_collision = place_meeting(round(x),round(y+vspd), obj_wall)
	
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
			
			for(var ii=0;ii<10;ii++) {
				instance_create_layer(x + 32,y + 32,"Front",obj_dust);
				instance_create_layer(x - 32,y + 32,"Front",obj_dust);
			}
		}
	}
	y += vspd;
}