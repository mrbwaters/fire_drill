// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_only(target_object){
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Get variables from object calling this function
	x = target_object.x;
	y = target_object.y;
	
	hspd = target_object.hspd;
	vspd = target_object.vspd;
	
	x += hspd * delta_time;
	y += vspd * delta_time;
}