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
	audio_pause_all()
	audio_play_sound(mu_pause, 0, true)
	audio_play_sound(sfx_menuenter, 0, false)
}
if (paused) {
	selected -= (key_up2 - key_down2)
	if (key_jump) {
		ds_list_find_value(pause_menu, selected)[1]()
	}
	selected = clamp(selected, 0, ds_list_size(pause_menu) - 1)
}
border1_xstart = 0
border1_xend = 400
if (!start)
{
    start = true
    border1_x = border1_xend
}
var a = 0.2
    if paused
    {
        fade = approach(fade, 1, 0.1)
        border1_x = lerp(border1_x, border1_xstart, a)
    }
    else
    {
        fade = approach(fade, 0, 0.1)
        border1_x = lerp(border1_x, border1_xend, a)
    }