//META
testing		= false;

// Room logic
game_begin	= true;
next_room = rm_1; // Use to start/resume action
first_room	= rm_menu;

//Audio logic
mute = false;
bgm_play();

//Physics Globals
t_scale = .75; //Global Time Scale
grid_scale = 16; //Global Grid Scale

//PC Globals
pcx = 16;
pcy = 208;


// Turn off texture interpolation
gpu_set_texfilter(false);

//Move to first room
room_goto(first_room);