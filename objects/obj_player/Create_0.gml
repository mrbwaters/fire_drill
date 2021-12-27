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
jspd_max	= 1;
t_float		= 250;	// Delay time (in ms? [in 1/60 of a secs]) for gliding before applying gravity
t_jump		= 0;	// Placeholder value for initial time since last jump
v_fallmax	= 2;	// max fall velocity
v_climb		= 1;	// climbing velocity
v_run		= 1;	// running velocity
a_grav		= 0.000075; // gravity acceleration

on_ground	= false;
on_ladder	= false;

