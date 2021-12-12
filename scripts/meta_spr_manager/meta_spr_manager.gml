// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function meta_spr_manager() constructor {
	init_sprites = method(other, function() {
		var _i = 0; repeat (argument_count div 3) {
			prefix = argument[_i+1];
			spr_name = argument[_i+2];
			var _default = asset_get_index(prefix + spr_name);
			if (_default == -1) _default = prefix + "Idle";
		
			self.sprites[$ argument[_i]] = [_default];
			_i += 3;
		}
	});

	get_sprite = method(other, function(target_fsm) {
		return self.sprites[$ target_fsm.get_current_state()][0];
	});
}