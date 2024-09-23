function scr_collision() {
	//collisions created by monoe while i figure em out
    if (place_meeting(x + hsp, y, (obj_solid))) {
        yplus = 0;
        while (place_meeting(x + hsp, y - yplus, obj_solid) && yplus <= abs(1 * hsp))
			yplus += 1;
        if (place_meeting(x + hsp, y - yplus, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) x += sign(hsp);
            hsp = 0;
        } else {
            y -= yplus
        }
    }
    x = x + hsp;
    var _movingPlatform = instance_place(x, y + 1, obj_platform)
    if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
        if (vsp > 0) {

            vsp = 0;
            detect = 1;
        }
    }
    else {
        detect = 0;
    }
	while (place_meeting(x, y + vsp, obj_platform) && vsp > 0) {
		vsp--
		detect = true
	}
    if !place_meeting(x, y, obj_solid) && vsp >= 0 && place_meeting(x, y + 2 + abs(hsp), obj_solid) {
        while (!place_meeting(x, y + 1, obj_solid)) {
            y += 1;
        }
    }
    if (place_meeting(x, y + vsp, obj_solid)) {
        while (!place_meeting(x, y + sign(vsp), obj_solid)) {
            y += sign(vsp)
        }
        vsp = 0;
    }
	if (detect && vsp > 0)
		vsp = 0;
	else
		y += vsp
	vsp += grav
    grounded = place_meeting(x, y + 1, obj_solid) || place_meeting(x, y + 1, obj_platform)
}