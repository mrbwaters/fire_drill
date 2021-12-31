
function move_only(){
	x += hspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
	y += vspd * meta_game.t_scale * meta_game.grid_scale * delta_time*60/1000000;
}