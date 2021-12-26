// Handle User Input
scr_get_input();
get_player_input();

// Apply physics based on state
check_collisions_conditions();
apply_player_input();
update_player_state();
apply_player_state();
apply_collisions();
apply_movement();

// Print Debug Messages
print_debug_step();