// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//// Audio Control
function bgm_step() {
	
if meta_game.mute {
	audio_sound_gain(global._bgm,.0,.1)
	_sfx_gain = 0;
}

if !meta_game.mute {
	audio_sound_gain(global._bgm,.03,.1)
	_sfx_gain = 0.06;
}
}

function bgm_play(){
	
if variable_global_exists("_bgm") {
	bgm_stop();
}

switch (room) {
	default: 
	global._bgm = audio_play_sound(Track4_Adventure_Demo_0a, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break 
	case rm_2:
	global._bgm=audio_play_sound(Track1_Spooky_Demo_0b, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break
	
	case rm_3: 
	global._bgm = audio_play_sound(Track2_Scary_Demo_0a, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break
	
	case rm_1:
	global._bgm = audio_play_sound(Track3_Calm_Demo_0a, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break
	
	case rm_4:
	global._bgm = audio_play_sound(Track3_Calm_Demo_0a, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break
	
	case rm_menu:
	global._bgm = audio_play_sound(Track4_Adventure_Demo_0a, 5, true);
	audio_sound_gain(global._bgm,.03,.1);
	break
	}
}

function bgm_stop() {
	audio_stop_sound(global._bgm);
}

function sfx_play(_event){
	_sfx_index = sfx_hit1_C2_dry;
	
switch(_event) {
	case "Jump":	var _sfx_index	= sfx_hit1_C2_dry;	break;
	case "Land":	var _sfx_index	= sfx_thud1_C2_dry; break;	
	case "Tap":		var  _sfx_index = sfx_thud2_C2_dry; break;
	case "Death":	var _sfx_index	= sfx_death2;		break;
	
	// Menu SFX
	case "Menu_Select": var _sfx_index = sfx_tap;	break;
	case "Menu_Move":	var _sfx_index = sfx_tap2;	break;
	}
	
var _sfx = audio_play_sound(_sfx_index,4,false);
audio_sound_gain(_sfx,meta_game._sfx_gain,0.06);	
}


function vox_play(_event) {
	if variable_global_exists("_vox") {
		audio_stop_sound(global._vox)
	}
var _vox_index = sfx_hit1_C2_dry
	
switch(_event) {
	case "npc_wk_war": var _vox_index	= sfx_weekend_warrior_2;		break;
	case "npc_det_clm": var _vox_index	= sfx_determinded_climber_2;	break;
	case "npc_inj_clm": var _vox_index	= sfx_injured_climber_1;		break;
	case "npc_twr_astc": var _vox_index = sfx_death;					break;
}

global._vox = audio_play_sound(_vox_index,4,false);
audio_sound_gain(global._vox,meta_game._sfx_gain,0.06);	
}