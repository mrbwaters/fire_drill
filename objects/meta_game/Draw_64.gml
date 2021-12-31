/// @description Add testing UI as needed
if testing {
	draw_set_color(c_lime);
	draw_set_font(fnt_dialog);
	draw_text(10, 10, "FPS:  " + string(fps_real));
	draw_text(10, 30, "State:  " + string(obj_pc.state));
}