// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_gravity(target_object){
	vspd = target_object.vspd;
	vspdMax = target_object.vspdMax;
	
	// Govern physics of the world here
	grav = 5;
	vspd = min(vspd+grav, vspdMax);
}