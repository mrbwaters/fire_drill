// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function meta_init_sprites () {
	var _i = 0; repeat (argument_count div 3) {
		prefix = argument[_i+1];
		spr_name = argument[_i+2];
		var _default = asset_get_index(prefix + spr_name);
		if (_default == -1) _default = prefix + "Idle";
		
		self.sprites[$ argument[_i]] = [_default];
		_i += 3;
	}
}