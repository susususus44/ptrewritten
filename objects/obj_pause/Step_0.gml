scr_getinput()
if (keyboard_check_pressed(vk_escape) && paused) {
	selected = 0
	key_jump = true
}
if (keyboard_check_pressed(vk_escape) && !paused) {
	paused = true
	instance_deactivate_all(true)
}
if (paused) {
	move = (key_left + key_right)
	if (key_jump) {
		ds_list_find_value(pause_menu, selected)[1]()
	}
	selected += move
	selected = clamp(0, 0, ds_list_size(pause_menu))
}