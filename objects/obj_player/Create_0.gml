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

<<<<<<< Updated upstream
t_float = 250; //Delay time (in ms?) for gliding before applying gravity
t_jump=0; 
v_fallmax = 4;
v_climb=3;
v_run = 5;
a_grav = .000075;
=======
t_float = 250;	//Delay time (in ms?) for gliding before applying gravity
t_jump = 0;		// Placeholder value for initial time since last jump
v_fallmax = 4;	// max fall velocity
v_climb=3;		// climbing velocity
v_run = 5;		// running velocity
a_grav = .000075; // gravity acceleration
>>>>>>> Stashed changes

on_ground=false;	//set initial value
on_ladder=false;	//set initial value

// Turn off texture intterpolation
gpu_set_texfilter(false);

// Start Background Music
bgm_play(2);