for (var i = 0; i < ds_list_size(global.particle_list); ++i) {
	var q = ds_list_find_value(global.particle_list, i)
	if (is_struct(q)) {
		q.image_index += q.image_speed
		if (floor(q.image_index) == (q.image_number - 1))
			ds_list_delete(global.particle_list, i)
	}
}