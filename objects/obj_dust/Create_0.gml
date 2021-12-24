/// @description Insert description here
// You can write your code in this editor

vspd = .00002 * random_range(-1,1) 
hspd = .00006 * random_range(-1,1) 
				
t_destroy = current_time + 500 * random_range(0,1);

show_debug_message("Make Dust  " + string(current_time) + "  " + string(t_destroy));
