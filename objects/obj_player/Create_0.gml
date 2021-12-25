hspd = 0;
vspd = 0;

// Player states
enum states {
	idle,
	run,
	jump,
	fall
}

// set initial state
state = states.idle;

// Movement coefficients
jspd_max = 8;
hspd_max = 5;

t_float = 250; //Delay time (in ms?) for gliding before applying gravity
dt_jump=0; 
v_fallmax = 4;
a_grav = .000075;

// Turn off texture intterpolation
gpu_set_texfilter(false);

// Start Background Music
bgm_play(2);