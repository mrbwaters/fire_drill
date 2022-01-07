// Testing below to see if this can help textboxes print to front of screen

//if talking {
//	// Take min/max so that textbox does not go off the screen
//	var tboxx	= min(x - (meta_game.grid_scale / 2), room_width - sprite_get_width(spr_textbox));
//	var tboxy	= max(0, y - (sprite_get_height(sprite_index)) - (sprite_get_height(spr_textbox)) - (meta_game.grid_scale / 2));
//	var lspace	= (string_height(name) * 0.25);
	
//	draw_set_font(fnt_dialog);
//	draw_set_color(color);
//	draw_set_halign(fa_left);
//	draw_sprite(spr_textbox, 0, tboxx, tboxy);
//	draw_text_transformed(tboxx + 2, tboxy + 2, name, 0.25, 0.25, 0);
//	draw_text_ext_transformed(tboxx + 2, tboxy + 2 + lspace + 1, dialog[CONVERSATION, PAGE], lspace * 4 + 1, (sprite_get_width(spr_textbox) - 4) * 4, 0.25, 0.25, 0);
//}