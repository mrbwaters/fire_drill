/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_debug);

if global.win then draw_text(room_width/2 - 10, room_height/2, "You win!");
else draw_text(room_width/2 - 10, room_height/2, "Game over");