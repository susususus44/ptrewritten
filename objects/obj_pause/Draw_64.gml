draw_set_alpha(1)
if (pausespr != -4) {
	//i used chatgpt for this scaling, im lazy asf
    var original_width = sprite_get_width(pausespr);
    var original_height = sprite_get_height(pausespr);
    var target_width = 960;
    var target_height = 540;
    var xscale = target_width / original_width;
    var yscale = target_height / original_height;
    draw_sprite_ext(pausespr, 0, 0, 0, xscale, yscale, 0, c_white, 1);
	draw_set_alpha(fade)
	shader_set(sh_blur)
	draw_sprite_ext(pausespr, 0, 0, 0, xscale, yscale, 0, c_white, 1);
	shader_reset()
	draw_set_alpha(1)
}
if (fade > 0) {
    draw_set_alpha(fade - 0.5)
    draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
    draw_set_alpha(1)
}
draw_sprite_ext(spr_barthing, 0, 490 + border1_x, -100, 1, 1, 6, c_white, 1)
draw_set_font(global.bigfont)
draw_set_color(c_white)
var yy = 0
for (var i = 0; i < ds_list_size(pause_menu); ++i) {
	draw_set_halign(fa_center)
    var str = ds_list_find_value(pause_menu, i)[0]
    if (selected != i) {
		draw_sprite(str, 0, 960 + border1_x, yy + 10)
	}
    else {
		draw_set_color(c_white)
		shader_set(sh_invert)
		draw_sprite(str, 0, 960 + border1_x, yy + 10)
		shader_reset()
	}
    yy += sprite_get_height(str) + 5
}