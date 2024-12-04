function scr_player_freefall(){
	    move = key_left + key_right
	if (vsp >= 0)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            particle_create((x + (irandom_range(-25, 25))), (y + (irandom_range(-10, 35))), particle.dust)
            steppybuffer = 8
        }
        vsp += 1.5
		if (vsp > 20)
			vsp = 40
    }
	landAnim = true
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
        sprite_index = spr_bodyslamfall
    if (!grounded)
    {
        hsp = move * movespeed
        if (move != xscale && momentum == true && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momentum = false
        if (move != dir && move != 0)
        {
            dir = move
            movespeed = 0
        }
        if ((move == 0 && momentum == false) || scr_solid((x + hsp), y))
        {
            movespeed = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.6
        if (movespeed > 7)
            movespeed -= 0.05
        if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
            movespeed = 0
        if (move != 0)
            xscale = move
    }
	if (grounded && vsp > 0) {
            image_index = 0
            state = states.normal
            jumpstop = false
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 15 / room_speed
            }
            particle_create(x, (y + 3), particle.gpeffect)
	}
}