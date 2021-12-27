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
	
	if(vspd != 0) {
			if(place_meeting(x, y + vspd, meta_collision)) {
				repeat(abs(hspd)) {
					if(!place_meeting( x, y + sign(vspd), meta_collision)) {
						y += sign(vspd);
					}	else {
						break;
					}
				}
				vspd = 0;
				if (!on_ground) {
					on_ground = true;
					audio_play_sound(sfx_thud1_C2_dry,4,false);
					for(var ii=0;ii<10;ii++) {
						var hh = sprite_height;
						var ww = sprite_width;
						instance_create_layer(x + ww, y + hh, "Front", obj_dust);
						instance_create_layer(x, y + hh, "Front", obj_dust);
					}
				}
			}
	}
	y += vspd * delta_time*60/1000000;
	
	on_ladder = false;
	on_ladder = place_meeting(round(x+hspd),round(y), obj_ladder) | place_meeting(round(x),round(y+vspd), obj_ladder);
}