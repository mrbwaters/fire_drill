draw_self();
if talking {
	var tboxx = x - (meta_game.grid_scale / 2);
	var tboxy = y - spr_textbox.sprite_height - (meta_game.grid_scale / 2);
	
	draw_set_font(fnt_dialog);
	draw_sprite(spr_textbox, 0, tboxx, tboxy);
	draw_text_transformed(tboxx, tboxy, "Hey there.", 0.25, 0.25, 0);
}