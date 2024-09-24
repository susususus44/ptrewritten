pause_menu = ds_list_create()
paused = false
selected = 0
ds_list_add(pause_menu, ["pause_resume", function() {
	paused = false
	instance_activate_all()
}])
ds_list_add(pause_menu, ["pause_exit", function() {
	game_end()
}])