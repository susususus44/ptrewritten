for (var i = 0; i < ds_list_size(global.particle_list); ++i) {
	var q = ds_list_find_value(global.particle_list, i)
	if (is_struct(q)) {
		draw_sprite_ext(q.sprite_index, q.image_index, q.x, q.y, q.image_xscale, q.image_yscale, q.image_angle, q.image_blend, q.image_alpha)
	}
}