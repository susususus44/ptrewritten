pause_menu = ds_list_create()
paused = false
selected = 0
move = 0
pausespr = -4
start  = false
fade = 0
pauseicon = ds_list_create()
ds_list_add(pause_menu, [spr_resume, function() {
	paused = false
	if (sprite_exists(pausespr)) {
		sprite_delete(pausespr)
		pausespr = -4
	}
	audio_stop_sound(mu_pause)
	audio_play_sound(sfx_menuexit, 0, false)
	audio_resume_all()
	instance_activate_all()
	
}])
ds_list_add(pause_menu, [spr_setting, function() {
	game_restart()
}])
ds_list_add(pause_menu, [spr_restart, function() {
	game_restart()
}])
ds_list_add(pause_menu, [spr_titlescreen, function() {
	game_end()
}])