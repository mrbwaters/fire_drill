// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_fall(){
	apply_gravity();
	move_and_collide();
	if (vspd == 0) state = states.idle;
	else state = states.fall;
}