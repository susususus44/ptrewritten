global.screenwidth = 960
global.screenheight = 540
window_set_showborder(true)
surface_resize(application_surface, global.screenwidth, global.screenheight)
target = obj_player
offsetx = 0
offsety = 0
shake_mag = 0
shake_mag_acc = 0
camx = target.x - global.screenwidth / 2
camy = target.y - global.screenheight / 2