event_inherited();

if pushed {
	sprite_index = spr_det_clim_fall;
	if x > 18 {
		hspd = -0.05;
		vspd = 0;
	}  else {
		hspd = 	0;
		vspd = 0.1;
		image_angle += 1;
	}
	
	move_only();
	
	if y > 256 then instance_destroy();
}