draw_set_alpha(alpha)
draw_set_color(c_white)
draw_rectangle(0, 0, 960, 540, false)
alpha -= 0.01
if (alpha < 0)
	instance_destroy()