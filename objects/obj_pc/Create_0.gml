// Start location
x = meta_game.pcx;
y = meta_game.pcy;

// Movement Variables
hspd = 0;
vspd = 0;
facing = 0;

// Collision variables
// Create Map to store results of collision check
coords = ds_map_create();
get_collision(meta_collision, coords);

// Player pc_states
enum pc_states {
	idle,
	run,
	jump,
	fall,
	climb,
	death
}

// set initial state
state		= pc_states.idle;
prior_state =  state;
player_init = false;
init_room	= "null";
_sfx_gain = 0.05;

// Movement coefficients
jspd_max	= 1/10;
t_float		= 250/meta_game.t_scale;	// Delay time (in ms? [in 1/60 of a secs]) for gliding before applying gravity
t_jump		= 0;	// Placeholder value for initial time since last jump
v_fallmax	= 2/20;	// max fall velocity
v_climb		= 1/20;	// climbing velocity
v_run		= 1/20;	// running velocity
a_grav		= 0.000075; // gravity acceleration

// Fall vars
fall_dead = 96;
