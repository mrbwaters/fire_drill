var buttonx = init_buttonx;
var buttony = init_buttony;

draw_set_font(fnt_menu);
draw_set_color(color);
draw_set_halign(fa_center);

for (var i = 0; i < array_length(button_array); i++) {
	draw_sprite(spr_button, 0, buttonx, buttony + (i * 2 * grid_scale));
	if i == highlight then draw_sprite(spr_highlight, 0, buttonx, buttony + (i * 2 * grid_scale));
	draw_text_transformed(buttonx + (sprite_get_width(spr_button) / 2), buttony + 3 + (i * 2 * grid_scale), button_array[i, TEXT], 0.25, 0.25, 0);
}