// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_glide(){
if (current_time > t_jump + dt_float) state = states.glide;

	move_and_collide();
}