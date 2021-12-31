/// @description Special global keys
scr_get_input();

if key_restart then game_restart();
if key_menu then room_goto(rm_menu);
if key_test then testing = !testing;

if room = rm_1 then game_begin = false; // Hacky way of telling whether we're in opening menu or pause menu.