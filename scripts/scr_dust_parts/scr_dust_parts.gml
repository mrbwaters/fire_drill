// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_landing_dust(){
for(var ii=0;ii<20;ii++) {
		instance_create_layer(x + 32*random_range(-1,1),y + 32,"Front",obj_dust);
	}
}



// TODO: horizontal turning dust not working
function create_horiz_dust(_dir) {
	
	for(var ii=0;ii<10;ii++) {
		switch _dir {
		case -1: instance_create_layer(x + 32,y + 32,"Front",obj_dust);
		case 1:	instance_create_layer(x - 32,y + 32,"Front",obj_dust);
		case 0: instance_create_layer(x + 32*random_range(-1,1),y + 32,"Front",obj_dust);
		}
	}
}
