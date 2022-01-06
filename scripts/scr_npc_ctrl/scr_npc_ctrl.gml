// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function npc_step() {
	if distance_to_object(obj_pc) >= (meta_game.grid_scale / 2) {
		talking = false;
		if PAGE != 0 then PAGE = 0;
	} else {	
		if meta_game.key_action {		
			if talking == false {
				talking = true;
				switch object_index {
					case obj_det_clm:	vox_play("npc_det_clm");	break;
					case obj_inj_clm:	vox_play("npc_inj_clm");	break;
					case obj_twr_astc:	vox_play("npc_twr_astc");	break;
					case obj_wk_war:	vox_play("npc_wk_war");		break;
				}
			} else {
				if PAGE < (array_length(dialog[CONVERSATION]) - 1) then PAGE++;
				else {
					talking = false;
					PAGE = 0;
					if CONVERSATION < (array_length(dialog) - 1) then CONVERSATION++;
				}	
			}
		}
	}
if talking == true then obj_pc.state = pc_states.idle; // Disables PC action while talking
}