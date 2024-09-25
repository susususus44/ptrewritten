savedxscale = image_xscale * 32
savedyscale = image_yscale * 32
image_xscale = 1
image_yscale = 1
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