//META
testing		= false;

// Room logic
first_room	= rm_menu;
game_begin	= true;
next_room	= rm_1; // Use to start/resume action

//Audio logic
mute = false;
bgm_play();

//Physics Globals
t_scale = .75; //Global Time Scale
grid_scale = 16; //Global Grid Scale

//PC Globals
pcx = grid_scale * 6;
pcy = grid_scale * 13;


// Turn off texture interpolation
gpu_set_texfilter(false);

// Tool tips
show_tip	= false;
tip			= "TIP NOT ASSIGNED";

// Flags
flag_rm_1 = false;
flag_rm_2 = false;
flag_rm_3 = false;
flag_rm_4 = false;
flag_rm_5 = false;
flag_rm_6 = false;
//current_checkpoint = 

//Move to first room
room_goto(first_room);