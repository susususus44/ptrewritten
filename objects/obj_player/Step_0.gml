scr_collision()
scr_getinput()
switch (state) {
	case states.normal:
		scr_player_normal()
		break
	case states.jump: 
		scr_player_jump()
		break
	case states.freefall:
		scr_player_freefall()
		break
	case states.freefallend:
		scr_player_freefallend()
		break
}