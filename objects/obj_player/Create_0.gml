hspd = 0;
vspd = 0;

// Player states
enum states {
	idle,
	run,
	jump,
	fall,
	climb
}

// set initial state
state = states.idle;

// Movement coefficients
jspd_max = 8;
hspd_max = 5;

t_float = 250; //Delay time (in ms?) for gliding before applying gravity
t_jump=0; 
v_fallmax = 4;
v_climb=3;
v_run = 5;
a_grav = .000075;

on_ground=false;
on_ladder=false;

// Turn off texture intterpolation
gpu_set_texfilter(false);

// Start Background Music
bgm_play(2);