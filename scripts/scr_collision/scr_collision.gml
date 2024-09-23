function scr_collision() {
	//collisions created by monoe while i figure em out
    if (place_meeting(x + hsp, y, (obj_solid))) {
        yplus = 0;
        while (place_meeting(x + hsp, y - yplus, obj_solid) && yplus <= abs(1 * hsp)) yplus += 1;
        if (place_meeting(x + hsp, y - yplus, obj_solid)) {
            while (!place_meeting(x + sign(hsp), y, obj_solid)) x += sign(hsp);
            hsp = 0;
        } else {
            y -= yplus
        }
    }
    x = x + hsp;
    var _movingPlatform = instance_place(x, y + max(1, vsp), obj_platform);
    if (_movingPlatform && bbox_bottom <= _movingPlatform.bbox_top) {
        if (vsp > 0) {
            while (!place_meeting(x, y + sign(vsp), obj_platform)) {
                y = y + sign(vsp);
            }
            vsp = 0;
            detect = 1;
        }
    }
    else {
        detect = 0;
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
    y += vsp;
	vsp += grav
    grounded = place_meeting(x, y + 1, obj_solid) || place_meeting(x, y + 1, obj_platform)
}