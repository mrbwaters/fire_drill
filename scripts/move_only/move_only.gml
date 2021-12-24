// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Simple motion script for particles that don't have collisions.

function move_only(){
	x += hsp * delta_time;
	y += vsp * delta_time;
}