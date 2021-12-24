function apply_gravity(){
	
	// Govern physics of the world here
	grav = 0.00015 * delta_time; //This means objects fall at a constant rate - not like reality
	vsp = min(vsp+grav, vsp_max);
}