if show_tip {
	// Take min/max so that textbox does not go off the screen
	
	if !instance_exists(obj_pc) then exit;
	var tboxx	= min(obj_pc.x - (grid_scale / 2), room_width - sprite_get_width(spr_tip));
	var tboxy	= max(0, obj_pc.y - (sprite_get_height(spr_tip)) - (meta_game.grid_scale / 2));
	
	draw_set_font(fnt_tip);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_sprite(spr_tip, 0, tboxx, tboxy);
	draw_text_transformed(tboxx + 2, tboxy + (sprite_get_height(spr_tip)) / 3, tip, 0.25, 0.25, 0);
}