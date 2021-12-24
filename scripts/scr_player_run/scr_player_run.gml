// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_run(){
	show_debug_message("DEBUG RUN >>>> " + string(vspd));
	if (hspd == 0 and on_ground) state = states.idle;
	if (current_time > t_jump + t_float) apply_gravity();
	move_and_collide();
}