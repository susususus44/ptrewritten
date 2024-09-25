if (!sprite_exists(spr)) {
	spr = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), surface_get_height(surf), 0, 0, 0, 0)
	sprite_collision_mask(spr, bboxkind_precise, 1, 0, 0, 0, 0, 0, 0);
	surface_free(surf)
}
sprite_index = spr
draw_set_color(c_red)
draw_text(x, y, savedxscale)
draw_text(x, y, savedyscale)
draw_set_color(c_white)