if show_tip {
	if !instance_exists(obj_pc) then exit; // Don't run in menus or other rooms
	
	var tboxx	= room_width / 2;
	var tboxy	= (room_height - (sprite_get_height(spr_tip)));
	
	draw_set_font(fnt_tip);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_sprite(spr_tip, 0, tboxx, tboxy);
	draw_text_transformed(tboxx + 2, tboxy + (sprite_get_height(spr_tip)) / 3, tip, 0.25, 0.25, 0);
}

if blackout {
	draw_set_alpha(blackout_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, room_width, room_height, -1);
	draw_set_alpha(1); //reset alpha value so it doesn't mess with other draw events	
}