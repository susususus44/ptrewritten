function scr_getinput(){
	key_left = -keyboard_check(global.key_left)
	key_left2 = -keyboard_check_pressed(global.key_left)
	key_left3 = -keyboard_check_released(global.key_left)
	key_right = keyboard_check(global.key_right)
	key_right2 = keyboard_check_pressed(global.key_right)
	key_right3 = keyboard_check_released(global.key_right)
	key_up = keyboard_check(global.key_up)
	key_up2 = keyboard_check_pressed(global.key_up)
	key_up3 = keyboard_check_released(global.key_up)
	key_down = keyboard_check(global.key_down)
	key_down2 = keyboard_check_pressed(global.key_down)
	key_down3 = keyboard_check_released(global.key_down)
	key_jump2 = keyboard_check(global.key_jump)
	key_jump = keyboard_check_pressed(global.key_jump)
	key_jump3 = keyboard_check_released(global.key_jump)
	key_slap = keyboard_check(global.key_slap)
	key_slap2 = keyboard_check_pressed(global.key_slap)
	key_slap3 = keyboard_check_released(global.key_slap)
	key_attack = keyboard_check(global.key_attack)
	key_attack2 = keyboard_check_pressed(global.key_attack)
	key_attack3 = keyboard_check_released(global.key_attack)
	key_taunt = keyboard_check(global.key_taunt)
	key_taunt2 = keyboard_check_pressed(global.key_taunt)
	key_taunt3 = keyboard_check_released(global.key_taunt)
}
