function scr_player_jump(){
	var maxmovespeed = 8
    var maxmovespeed2 = 6
    var turnmovespeed = 2
    var accel = 0.5
    var deccel = 0.1
    var jumpspeed = -11
    var machspeed = 6
    if (dir != xscale)
    {
        dir = xscale
        movespeed = turnmovespeed
    }
	move = key_left + key_right
    landAnim = true
    if (!momentum)
        hsp = move * movespeed
    else
        hsp = xscale * movespeed
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < maxmovespeed)
            movespeed += accel
        else if (floor(movespeed) == maxmovespeed)
            movespeed = maxmovespeed2
        if (scr_solid((x + xscale), y) && move == xscale)
            movespeed = 0
    }
    else
        movespeed = 0
    if (movespeed > maxmovespeed)
        movespeed -= deccel	
    if (!jumpstop)
    {
        if ((!key_jump2) && vsp < 0.5)
        {
            vsp /= 20
            jumpstop = true
        }
        else if (scr_solid(x, (y - 1)))
        {
            vsp = grav
            jumpstop = true
        }
    }
	if (grounded && vsp > 0) {
		landAnim = true
		state = states.normal
		jumpstop = false
		image_index = 0
		particle_create(x, y, particle.landcloud)
	}
	if (sprite_index == spr_jump && floor(image_index) == image_number - 1) {
		sprite_index = spr_fall
	}
    if (key_down2)
    {
		sprite_index = spr_bodyslamstart
        image_index = 0
        state = states.freefall
		state = states.freefall
        vsp = -6
	}
}