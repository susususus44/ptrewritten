function scr_player_normal(){
	var maxmovespeed = 8
    var maxmovespeed2 = 6
    var accel = 0.5
    var deccel = 0.1
    var jumpspeed = -11
    var idlespr = spr_idle
    var movespr = spr_move
	move = key_left + key_right
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
    }
	if (move != 0) {
		sprite_index = movespr
        if (move != 0)
            xscale = move
        if (movespeed < maxmovespeed)
            movespeed += accel
        else if (floor(movespeed) == maxmovespeed)
            movespeed = maxmovespeed2
        if (movespeed < (floor(maxmovespeed2) / 2) && move != 0)
            image_speed = 0.35
        else if (movespeed > (floor(maxmovespeed2) / 2) && movespeed < maxmovespeed2)
            image_speed = 0.45
        else
            image_speed = 0.6
		if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && xscale == move && (!(place_meeting(x, (y + 1), obj_slope))))
            movespeed = 0
		if (steppybuffer > 0) {
			steppybuffer--
		}
		else {
			particle_create(x, y + 43, particle.dust)
			steppybuffer = 12
		}
	}
	else {
		movespeed = 0
		sprite_index = idlespr
		image_speed = 0.35
	}
    if (movespeed > maxmovespeed)
        movespeed -= deccel
	if landAnim
    {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = false
            }
            else
            {
                sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = false
                    sprite_index = movespr
                    image_index = 0
                }
            }
    }
	hsp = move * movespeed
	if (grounded) {
		if (key_jump) {
			state = states.jump
			vsp = jumpspeed
			sprite_index = spr_jump
			image_index = 0
			image_speed = 0.35
			particle_create(x, y, particle.jumpcloud)
		}
	}
	if (!grounded) {
		state = states.jump
		jumpstop = true
		sprite_index = spr_fall
	}
}