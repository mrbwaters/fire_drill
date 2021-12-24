/// @description Insert description here
// You can write your code in this editor

	object_set_sprite(self, spr_stone_floor1);

rnd_spr=irandom_range(1,3);
switch(rnd_spr){
	case 1:
	object_set_sprite(self, spr_stone_floor1);
	break
	case 2:
	object_set_sprite(self, spr_stone_floor2);
	break
	case 3:
	object_set_sprite(self, spr_stone_floor3);
	break
}