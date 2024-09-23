view_enabled[0] = true
view_visible[0] = true
window_set_size(global.screenwidth, global.screenheight)
camera_set_view_size(view_camera[0], global.screenwidth, global.screenheight)
camx = (target.x - camera_get_view_width(view_camera[0]) / 2) + offsetx
camy = (target.y - camera_get_view_height(view_camera[0]) / 2) + offsety
camx = clamp(camx, 0, room_width - camera_get_view_width(view_camera[0]))
camy = clamp(camy, 0, room_height - camera_get_view_height(view_camera[0]))
var shake = irandom_range(-shake_mag, shake_mag)
var shake2 = irandom_range(-shake_mag, shake_mag)
camera_set_view_pos(view_camera[0], camx + shake, camy + shake2)
if (shake_mag > 0)
	shake_mag -= shake_mag_acc