// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function vfx_part_landing() {
	for(var ii=0;ii<10;ii++) {
		instance_create_layer(x + 32,y + 32,"Front",obj_dust);
		instance_create_layer(x - 32,y + 32,"Front",obj_dust);
		}
}