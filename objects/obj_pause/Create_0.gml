pause_menu = ds_list_create()
paused = false
selected = 0
move = 0
pausespr = -4
start  = false
fade = 0
pauseicon = ds_list_create()
ds_list_add(pause_menu, ["RESUME", function() {
	paused = false
	if (sprite_exists(pausespr)) {
		sprite_delete(pausespr)
		pausespr = -4
	}
	instance_activate_all()
}])
ds_list_add(pause_menu, ["RESTART", function() {
	game_restart()
}])
ds_list_add(pause_menu, ["EXIT", function() {
	game_end()
}])
scr_pauseicon_add(spr_pauseicons, 0, -20, -12)
scr_pauseicon_add(spr_pauseicons, 2, -10)
scr_pauseicon_add(spr_pauseicons, 3, -10)