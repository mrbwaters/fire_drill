// Handle User Input
scr_get_input();
get_player_input();

// Apply physics based on state

apply_player_input();
apply_player_state();
move_and_collide()
update_player_state();

// Print Debug Messages
print_debug_step();