// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function platform_init() {
//Set initial coordinates
var x1_temp= x;
var y1_temp= y;
//Set final coordinates
var x2_temp= x + grid_x_move * meta_game.grid_scale;
var y2_temp= y + grid_y_move * meta_game.grid_scale;

x1= min(x1_temp,x2_temp);
x2= max(x1_temp,x2_temp);
y1= min(y1_temp,y2_temp);
y2= max(y1_temp,y2_temp);

mvspd=grid_move_spd * meta_game.grid_scale;

// 
dx_path = x2 - x1;
dy_path = y2 - y1;
r_path = sqrt(power(dx_path,2) + power(dy_path,2));


hspd_max= mvspd * dx_path/r_path;
vspd_max= mvspd * dy_path/r_path;

show_debug_message("Platform init >>X:" + string(x) + " >>Y:" +string(y))

_init=true;
}

function platform_step(){
	
	if !_init {platform_init()}
	
	var _dx=(x-x1);
	var _dy=(y-y1);
	
	if (_dx<=0 and _dy<=0) dir=1;
	if (_dx>=dx_path and _dy>=dy_path) dir=-1;
	
	hspd = hspd_max * dir;
	vspd = vspd_max * dir;		
	move_only();
}
	
	
	
	
