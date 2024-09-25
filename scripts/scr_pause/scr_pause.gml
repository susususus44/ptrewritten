function scr_pauseicon_add(spr, img, xoffset = 0, yoffset = 0) {
	ds_list_add(pauseicon, 
	{
		sprite_index: spr,
		image_index: img,
		image_alpha: 0,
		sprite_xoffset: xoffset,
		sprite_yoffset: yoffset,
		shakex: 0,
		shakey: 0,
	}
	)
}
function scr_pauseicon_update(selected) {
	for (var i = 0; i < ds_list_size(pauseicon); i++) {
		with(ds_list_find_value(pauseicon, i)) {
			if (selected == i) {
				image_alpha = approach(image_alpha, 1, 0.2)
				shakex = irandom_range(-1, 1)
				shakey = irandom_range(-1, 1)
			}
			else {
				shakex = 0
				shakey = 0
				image_alpha = approach(image_alpha, 0, 0.2)
			}
		}
	}
}
function scr_pauseicon_draw(_x, _y, _id) {
	var icon = ds_list_find_value(pauseicon, _id)
	draw_sprite_ext(icon.sprite_index, icon.image_index, _x + icon.sprite_xoffset + icon.shakex, _y + icon.sprite_yoffset + icon.shakey, 1, 1, 0, c_white, icon.image_alpha)
}