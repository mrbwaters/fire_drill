// Declare methods from User Event 15
event_user(15);

// Sprite management
sprites = {};
init_sprites(
	"idle", "Idle",
	"run",	"Run",
	"jump",	"Jump",
	"fall",	"Fall"
	);

// Variables
spd = 3;
hspd = 0;
vspd = 0;
vspdMax = 15;

jspd = 12;
gravGround = .6;	// Normal gravity
grav = gravGround;

face = 1;
coyoteDuration = 8;

// Input
input = {};
check_input();

name = "Anim4r";

fsm = new SnowState("idle");

fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		draw_sprite_ext(sprite_index, image_index, x, y, face * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	.add("idle", {
		enter: function() {
			sprite_index = get_sprite();
			image_speed = 1;
			
			hspd = 0;
			vspd = 0;
		},
		step: function() {
			// If left or right keys are pressed, run
			if (abs(input.hdir)) {
				fsm.change("run");
				return;
			}
			
			// If jump key is pressed, jump
			if (input.jump) {
				fsm.change("jump");
				return;
			}
            
			// Movement
			apply_gravity();
			move_and_collide();
			
			// Check if I'm flating
			if (!on_ground()) {
				fsm.change("fall");
				return;
			}
		}
	})
	.add("run", {
		enter: function() {
			sprite_index = get_sprite();
			image_speed = 1;
		},
		step: function() {
			var _dir = input.hdir;
			hspd = spd * _dir;
			
			// If left and right keys are not pressed, switch back to idle
			if (_dir == 0) {
				fsm.change("idle");
				return;
			}
			
			face = _dir;
			
			// If jump key is pressed, jump
			if (input.jump) {
				fsm.change("jump");
				return;
			}
			
			// Movement
			apply_gravity();
			move_and_collide();
			
			// Check if I'm flating
			if (!on_ground()) {
				fsm.change("fall");
				return;
			}
		}
	})
	.add("jump", {
		enter: function() {
			sprite_index = get_sprite();
			image_index = 0;
			image_speed = 1;
			
			vspd = -jspd;	// Jump
		},
		step: function() {			
			// Movement
			apply_gravity();
			move_and_collide();
			
			// Check when we should start falling
			if (vspd >= 0) {
				fsm.change("fall");
				return;
			}
		}
	})
	.add("fall", {
		enter: function() {
			sprite_index = get_sprite();
			image_index = 0;
			image_speed = 1;
		},
		
		step: function() {
			var _dir = input.hdir;
			hspd = spd * _dir;
			if (_dir != 0) face = _dir;
			
			// Coyote time
			if ((fsm.get_time(false) <= coyoteDuration) && input.jump) {
				// Apply only if we were running
				if (fsm.get_previous_state() == "run") {
					fsm.change("jump");
					return;
				}
			}
			
			// Movement
			apply_gravity();
			move_and_collide();
			
			// Check when we land
			if (on_ground()) {
				fsm.change("idle");
				return;
			}
		}
	});