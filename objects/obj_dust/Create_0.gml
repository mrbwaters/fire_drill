/// @description Insert description here
// You can write your code in this editor

vsp = .00002 * random_range(-1,1) 
hsp = .00006 * random_range(-1,1) 
				
t_destroy = current_time + 500 * random_range(0,1);

if global.debug {
	show_debug_message("Make Dust  " + string(current_time) + "  " + string(t_destroy));
	}