// Declare methods from User Event 15
event_user(15);

global.win = false;

sprites = {};
meta_init_sprites(
	"idle", "spr_Player", "Idle",
	"run",  "spr_Player", "Run",
	"jump", "spr_Player", "Jump",
	"fall", "spr_Player", "Fall",
	"dead", "spr_Player", "Dead",
	"win",  "spr_Player", "Win"
	);
spr_list = sprites;
player_fsm = new meta_move_fsm(obj_player, spr_list);
player_fsm.sprites = sprites;

player_fsm.move_cfg.fsm
	.history_enable()
	.history_set_max_size(20)
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	
	//Check to see if these apply to every object using an FSM struct or just this object
	.add("dead", {
		enter: function() {
			move_cfg.target_object.sprite_index = move_cfg.sprites[$ move_cfg.fsm.get_current_state()][0];
			move_cfg.target_object.image_index = 0;
			move_cfg.target_object.image_speed = 1;
			
			move_cfg.hspd = 0;
			move_cfg.vspd = 0;
			room_goto(rm_game_over);
		}
	})
	.add("win", {
		enter: function() {
			move_cfg.target_object.sprite_index =  move_cfg.sprites[$ move_cfg.fsm.get_current_state()][0];
			move_cfg.target_object.image_index = 0;
			move_cfg.target_object.image_speed = 1;
			
			move_cfg.hspd = 0;
			move_cfg.vspd = 0;
			global.win = true;
			room_goto(rm_game_over);
		}
	});
	
