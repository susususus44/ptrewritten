if (paused) {
	draw_set_color(c_black)
	for (var i = 0; i < ds_list_size(pause_menu); ++i) {
		var str = ds_list_find_value(pause_menu, i)[0]
		if (selected != i)
			draw_set_color(c_gray)
		draw_text(300, 50 + i * 20, str)
	}
}