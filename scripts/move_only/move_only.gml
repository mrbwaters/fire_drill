// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_only(){
	x += hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
	y += vspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
}