enum getinf {
	spr,
	imgsp,
}
function getspr(_state, _getinf) {
	switch (_getinf) {
		case getinf.spr:
		switch (_state) {
			case particle.dust:
				return spr_cloudeffect
				break
			case particle.jumpcloud:
				return spr_highjumpcloud2
				break
			case particle.landcloud:
				return spr_landcloud
				break
			case particle.gpeffect:
				return spr_groundpoundeffect
				break
			default:
				return spr_cloudeffect;
				break
		}
		break
		case getinf.imgsp:
		switch (_state) {
			case particle.gpeffect:
				return 0.35
				break
			default:
				return 0.5;
				break
		}
		break
	}
}
function particle_create(_x, _y, _state) {
	var _struct = { 
        x: _x,
        y: _y,
        sprite_index: getspr(_state, getinf.spr),
        image_speed: getspr(_state, getinf.imgsp),
		image_alpha: 1,
		image_angle: 0,
		image_index: 0,
		image_blend: c_white,
		image_number: sprite_get_number(getspr(_state, getinf.spr)),
		image_xscale: 1,
		image_yscale: 1,
		state: _state,
	}
	ds_list_add(global.particle_list, _struct)
}