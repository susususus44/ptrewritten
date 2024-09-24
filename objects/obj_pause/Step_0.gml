scr_getinput()
if (keyboard_check_pressed(vk_escape) && paused) {
	selected = 0
	key_jump = true
	sprite_delete(pausespr)
	pausespr = -4
}
if (keyboard_check_pressed(vk_escape) && !paused) {
	screen_save("tempscreen.png")
	pausespr = sprite_add("tempscreen.png", 1, false, false, 0, 0)
	file_delete("tempscreen.png")
	paused = true
	instance_deactivate_all(true)
}
if (paused) {
	selected -= (key_up - key_down)
	if (key_jump) {
		ds_list_find_value(pause_menu, selected)[1]()
	}
	selected = clamp(selected, 0, ds_list_size(pause_menu) - 1)
}
border1_xstart = 0
border1_ystart = 540
border1_xend = -96
border1_yend = 540 + 100
border2_xstart = 960
border2_ystart = 540
border2_xend = 960 + 96
border2_yend = 540 + 100
vine_ystart = 0
vine_yend = -117
if (!start)
{
    start = true
    border2_x = border2_xend
    border2_y = border2_yend
    border1_x = border1_xend
    border1_y = border1_yend
    vine_y = vine_yend
}
var a = 0.1
    if paused
    {
        fade = approach(fade, 1, 0.1)
        border1_x = lerp(border1_x, border1_xstart, a)
        border1_y = lerp(border1_y, border1_ystart, a)
        border2_x = lerp(border2_x, border2_xstart, a)
        border2_y = lerp(border2_y, border2_ystart, a)
        vine_y = lerp(vine_y, vine_ystart, a)
    }
    else
    {
        fade = approach(fade, 0, 0.1)
        border1_x = lerp(border1_x, border1_xend, a)
        border1_y = lerp(border1_y, border1_yend, a)
        border2_x = lerp(border2_x, border2_xend, a)
        border2_y = lerp(border2_y, border2_yend, a)
        vine_y = lerp(vine_y, vine_yend, a)
    }