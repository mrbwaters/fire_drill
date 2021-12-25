hsp = 0;
vsp = 0;

// Player states
enum states {
	idle,
	run,
	jump,
	fall
}

on_ground	= true;

state		= states.idle;			
run_spd		= 8;

// Jump
jspd		= 30;
t_float		= 0; //2 * power(10, 2); //delay before applying gravity
t_jump		= 0; 
vsp_max	= 10;

// Turn off texture intterpolation
gpu_set_texfilter(false);