//META
first_room	= rm_menu;
testing		= false;
game_begin	= true;

next_room = rm_1; // Use to start/resume action

//Physics Globals
t_scale = .75; //Global Time Scale
grid_scale = 16; //Global Grid Scale

//PC Globals
pcx = 16;
pcy = 208;

// Turn off texture interpolation
gpu_set_texfilter(false);

// Start Background Music
bgm_play(2);

//Move to first room
room_goto(first_room);