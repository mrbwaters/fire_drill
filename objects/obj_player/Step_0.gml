// Handle User Input
scr_get_input();
get_player_input();
apply_player_input();

// Apply physics based on state
update_player_state();
apply_player_state();

// Print Debug Messages
print_debug_console();
