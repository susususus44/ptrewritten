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
}
if (fade > 0) {
    draw_set_alpha(fade - 0.5)
    draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false)
    draw_set_alpha(1)
}
draw_set_alpha(fade)
draw_sprite_ext(spr_pause_border, 0, border1_x, border1_y, -1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_border, 0, border2_x, border2_y, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_vine, 0, 960 / 2, vine_y, 1, 1, 0, c_white, 1)
draw_set_font(global.bigfont)
draw_set_color(c_white)
var yy = 0
var height = string_height("ABC")
var actualheight = height
var offset = 16
height *= ds_list_size(pause_menu)
yy -= height / 2
for (var i = 0; i < ds_list_size(pause_menu); ++i) {
	draw_set_halign(fa_center)
    var str = ds_list_find_value(pause_menu, i)[0]
    if (selected != i) 
		draw_set_color(c_gray)
    else 
		draw_set_color(c_white)
    draw_text(480, 270 + yy, str)
    yy += actualheight + offset
	if (fade > 0 && paused)
		scr_pauseicon_draw(480 + string_width(str) / 2 + 50, 270 + yy - 40, i)
}
