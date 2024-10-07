reversexscale = sign(image_xscale)
reverseyscale = sign(image_yscale)
savedxscale = image_xscale * 32 * reversexscale
savedyscale = image_yscale * 32 * reverseyscale
image_xscale = 1 * reversexscale
image_yscale = 1 * reverseyscale
surf = surface_create(savedxscale, savedyscale);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_set_color(c_red)
draw_set_alpha(0.9)
draw_triangle(0, savedyscale, savedxscale, savedyscale, savedxscale, 0, false);
draw_set_alpha(1)
draw_set_color(c_white)
surface_reset_target();
spr = -4
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