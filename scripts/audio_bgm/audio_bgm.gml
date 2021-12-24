// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bgm_play(mood){
	
if variable_global_exists("_bgm") {
	audio_stop_sound(global._bgm);
}

switch (mood) {
	case "Spooky":
	case 1:
	global._bgm=audio_play_sound(Track1_Spooky_Demo_0b, 5, true);

	break
	case "Scary": 
	case 2:
	global._bgm = audio_play_sound(Track2_Scary_Demo_0a, 5, true);
	break
	
	case "Calm":
	case 3:
	global._bgm = audio_play_sound(Track3_Calm_Demo_0a, 5, true);
	break
	
	case "Adventure":
	case 4:
	global._bgm=audio_play_sound(Track4_Adventure_Demo_0a, 5, true);
	break
	}
	
	audio_sound_gain(global._bgm,.05,.1);
}

function bgm_stop() {
	audio_stop_sound(global._bgm);
}

function bgm_ctrl() {
	
if keyboard_check_pressed(ord("1")) bgm_play(1);
if keyboard_check(ord("2")) bgm_play(2);
if keyboard_check(ord("3")) bgm_play(3);
if keyboard_check(ord("4")) bgm_play(4);
}