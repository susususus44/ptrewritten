if (fade > 0) {
	draw_set_alpha(1)
	if (pausespr != -4)
		draw_sprite(pausespr, 0, 0, 0)
	draw_set_font(global.bigfont)
	draw_set_color(c_white)
	for (var i = 0; i < ds_list_size(pause_menu); ++i) {
		var str = ds_list_find_value(pause_menu, i)[0]
		if (selected != i)
			draw_set_color(c_gray)
		draw_text(300, 50 + i * 20, str)
	}
}
if (fade > 0) {
    draw_set_alpha(fade - 0.5)
    draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
	draw_set_alpha(1)
}
draw_sprite_ext(spr_pause_border, 0, border1_x, border1_y, -1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_border, 0, border2_x, border2_y, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_vine, 0, 960 / 2, vine_y, 1, 1, 0, c_white, 1)
