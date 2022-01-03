// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function print_debug_step() {
	show_debug_message("DEBUG: STATE >>> " + string(state) + "  PRIOR_STATE >>> " + string(prior_state));
	show_debug_message(
		//"DBG tol >> " + string(coords[?"tol"]) +
		" DBG x_new >> " + string(coords[?"x_new"]) +
		" DBG y_new >> " + string(coords[?"y_new"]) +
		" DBG dx >> " + string(coords[?"dx"]) +
		" DBG dy >> " + string(coords[?"dy"]) +
		" DBG vert_collide >> " + string(coords[?"vert_collide"]) +
		" DBG horiz_collide >> " + string(coords[?"horiz_collide"])
	);
}
