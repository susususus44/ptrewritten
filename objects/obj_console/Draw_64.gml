draw_set_font(font_console)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(0.75)
if (length>0)
	draw_rectangle_color(480 - length, 0, 480 + length, 200, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
if (length>0)
	draw_line_color(480 - length, 200, 480 + length, 200, c_white, c_white)
if (!surface_exists(surf))
{
    surf = surface_create(960, 200);
}
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
if (length == 480)
	draw_text(10, 180 - scrollpos, string_concat(str, (showcursor ? "|" : "")))
if (length == 480)
for (var i = 0; i < array_length(history); ++i){
	if (history[i][1] != 2) {
	draw_set_alpha(0.5)
	if (history[i][1])
		draw_set_color(c_red)
	else
		draw_set_color(c_green)
	draw_rectangle(480 - length, ((180 - lerppos) + 20 * i) - scrollpos, 480 + length, ((198 - lerppos) + 20 * i) - scrollpos, false) 
	}
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text(10, ((180 - lerppos) + 20 * i) - scrollpos, string_replace(history[i][0], " - FAILED", ""))
}
surface_reset_target();
draw_set_alpha(1)
draw_surface(surf, 0, 0);
if (length == 480)
for (var i = 0; i < array_length(search); ++i){
	draw_set_alpha(0.75)
	draw_set_color(c_black)
	draw_rectangle(0, 201 + i * 20, string_length(search[i]) * 10, 220 + i * 20, false) 
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_text(10, 202 + 20 * i, string_replace(search[i], " - FAILED", ""))
}
draw_set_halign(fa_right)
if (length == 480)
draw_text(959, 0, "Vadimos's debug console")
var arrnum = -((array_length(history) - 9) * 20)
if (array_length(history) - 9) < 0
	arrnum = 0
draw_set_color(c_white)
draw_set_halign(fa_left)