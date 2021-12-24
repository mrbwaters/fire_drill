// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function apply_gravity(){
	
	// Govern physics of the world here
	grav = .00015*delta_time;
	vspd = min(vspd+grav, vspdMax);
}