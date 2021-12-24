hspd = 0;
vspd = 0;

// Player states
enum states {
	idle,
	run,
	jump
}

state		= states.idle;			
run_spd		= 8;

// Jump
jspd		= 10;
t_float		= .2 * power(10,3); //delay before applying gravity
t_jump		= 0; 
vspd_max	= 10;


// Turn off texture intterpolation
gpu_set_texfilter(false);


// Start Background Music
bgm_play(2);