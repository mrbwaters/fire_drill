/// @description Special global keys
scr_get_input();

if (key_menu || key_start) && room != rm_menu {
	next_room = room;
	room_persistent = true;
	room_goto(rm_menu);
}

//if key_test then testing = !testing;
if key_restart then game_restart();

if room == rm_1 then game_begin = false; // Hacky way of telling whether we're in opening menu or pause menu.


//// Audio Control
// Start Background Music
if !room_init {
	bgm_play();
	room_init=true;
}


if mute {
	audio_sound_gain(global._bgm,.0,.1)
	_sfx_gain = 0;
}

if !mute {
	audio_sound_gain(global._bgm,.03,.1)
	_sfx_gain = 0.06;
}
