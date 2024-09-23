if (keyboard_check_pressed(vk_f5)) {
    if (!opened) {
        opened = true
        timeout = 3
        keyboard_string = str
    } else {
        opened = false
    }
}
if (opened) {
	scrollto += mouse_wheel_down() * 20
	scrollto -= mouse_wheel_up() * 20
	var arrnum = -((array_length(history) - 9) * 20)
	if (array_length(history) - 9) < 0
		arrnum = 0
	scrollto = clamp(scrollto, arrnum, 0)
    lerppos = lerp(lerppos, lerpto, 0.4)
	scrollpos = lerp(scrollpos, scrollto, 0.4)
    length = approach(length, 480, 50)
    if (timeout > 0)
        timeout--
    else {
		if (keyboard_check(vk_control) && keyboard_check_pressed(ord("Z")) && array_length(prevstr) != 0)
		{
			str = prevstr[array_length(prevstr) - 1]
			keyboard_string = prevstr[array_length(prevstr) - 1]
			array_resize(prevstr, array_length(prevstr) - 1);
		}
		if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
		{
			str += clipboard_get_text();
			keyboard_string += clipboard_get_text();
		}
		if (str != keyboard_string) {
			array_push(prevstr, str)
			str = keyboard_string
			scrollpos = 0
			scrollto = 0
		}
    }
    search = []
    for (var i = 0; i < array_length(command_list); ++i) {
		var _length = string_length(str)
		_length = clamp(_length, 0, string_length(command_list[i]))
        if (string_copy(command_list[i], 0, _length) == str) {
            array_push(search, command_list[i])
        }
    }
    if (keyboard_check_pressed(vk_tab) && array_length(search) > 0)
	{
		var searchstr = string_split(search[0], " ")
        keyboard_string = searchstr[0]
	}
    if (keyboard_check_pressed(vk_enter) && str != "") {
        var arr = string_split(str, " ")
        failed = false
        switch (arr[0]) {
            case "room_goto":
                if (string_length(arr) > 1) {
                    if (room_exists(asset_get_index(arr[1]))) {
                        var rm = asset_get_index(arr[1])
                        show_debug_message(rm)
                        room_goto(rm)
                    } else {
                        failed = true
                    }
                } else {
                    failed = true
                }
                break
			case "instance_create":
                if (array_length(arr) >= 4) {
                    if (object_exists(asset_get_index(arr[4]))) {
                        var obj = asset_get_index(arr[4])
                        show_debug_message(obj)
                        instance_create_depth(real(arr[1]), real(arr[2]), real(arr[3]), obj) 
                    } else {
                        failed = true
                    }
                } else {
                    failed = true
                }
                break
            default:
                failed = true
                break
        }
        array_push(history, [str, failed])
        keyboard_string = ""
        failed = false
        lerpto += 20
		scrollpos = 0
		scrollto = 0
    }
} else {
    length = approach(length, 0, 50)
}