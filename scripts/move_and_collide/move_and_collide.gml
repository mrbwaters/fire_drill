function move_and_collide(){	
	// Check for collisions with collision objects
	if(hsp != 0) {
			if(place_meeting(x + hsp, y, meta_collision)) {
				repeat(abs(hsp)) {
					if(!place_meeting(x + sign(hsp), y, meta_collision)) {
						x += sign(hsp);
					}	else {
						break;
					}
				}
				horizontal_collision = true;
				hsp = 0;
			}
			else horizontal_collision = false;
		}
	x += hsp;
	
	if(vsp != 0) {
		if(place_meeting(x, y + vsp, meta_collision)) {
			repeat(abs(vsp)) {
				if(!place_meeting(x, y + sign(vsp), meta_collision)) {
					y += sign(vsp);
				}	else {
					break;
				}
			}
			vertical_collision = true;
			vsp = 0;
			if (!on_ground) {
				on_ground = true;
				audio_play_sound(sfx_thud1_C2_dry,4,false);
			
				for(var ii=0;ii<10;ii++) {
					instance_create_layer(x + 32,y + 32,"Front",obj_dust);
					instance_create_layer(x - 32,y + 32,"Front",obj_dust);
				}
			}
		}
		else vertical_collision = false;
	}
	y += vsp;
}