var buttonx = init_buttonx;
var buttony = init_buttony;

for (var i = 0; i < array_length(button_array); i++) {
	draw_sprite(spr_button, 0, buttonx, buttony + (i * 2 * meta_game.grid_scale));
	if i == highlight then draw_sprite(spr_highlight, 0, buttonx, buttony + (i * 2 * meta_game.grid_scale));
	draw_set_font(fnt_menu);
	draw_set_color(color);
	draw_text_transformed(buttonx + 2, buttony + 2 + (i * 2 * meta_game.grid_scale), button_array[i, TEXT], 0.25, 0.25, 0);
}