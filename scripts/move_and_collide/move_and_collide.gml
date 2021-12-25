// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_and_collide(){	
	//Collision checks with collision objects
	if(hspd != 0) {
			if(place_meeting(x + hspd, y, meta_collision)) {
				repeat(abs(hspd)) {
					if(!place_meeting(x + sign(hspd), y, meta_collision)) {
						x += sign(hspd);
					}	else {
						break;
					}
				}
				hspd = 0;
			}
		}
	x += hspd;
	
	if(move_y != 0) {
			if(place_meeting(x, y + move_y, meta_collision)) {
				repeat(abs(hspd)) {
					if(!place_meeting( x, y + sign(move_y), meta_collision)) {
						y += sign(move_y);
					}	else {
						break;
					}
				}
				move_y = 0;
				if (!on_ground) {
					on_ground = true;
					audio_play_sound(sfx_thud1_C2_dry,4,false);
					for(var ii=0;ii<10;ii++) {
						instance_create_layer(x + 32,y + 32,"Front",obj_dust);
						instance_create_layer(x - 32,y + 32,"Front",obj_dust);
					}
				}
			}
	}
	y += vspd;
}	