function draw_text_extra(_x, _y, _string){
var draw_chr = "";
var draw_xstart = round(_x - (100 / 2));
var draw_ystart = round(_y - (1 / 2));
var draw_x = draw_xstart;
var draw_y = draw_ystart;
var shake = false
for (var ltr = 1; ltr <= string_length(_string); ltr += 1;)
{
    draw_chr = string_char_at(_string, ltr);
    if (draw_chr == "{")
    {
		var font_str = ""
		var font_chr = ""
        for (ltr += 1; string_char_at(_string, ltr) != "}"; ++ltr) {
			font_chr = string_char_at(_string, ltr);
			font_str += font_chr
			show_debug_message(string_char_at(_string, ltr))
		}
		if (string_lower(font_str) == "s")
		{
			shake = true
		}
		show_debug_message(font_str)
		ltr += 1
		draw_chr = string_char_at(_string, ltr);
    }
    if (draw_chr == "/") 
    {
		shake = false
		ltr += 1
		draw_chr = string_char_at(_string, ltr);
    }
	var _shx = 0
	var _shy = 0
	if (shake)
	{
		_shx = irandom_range(-1, 1)
		_shy = irandom_range(-1, 1)
	}
    draw_text(draw_x + _shx, draw_y + _shy, draw_chr);
    if (draw_chr == "\n")
    {
        draw_x = draw_xstart;
        draw_y += round(60 / 2);
    }
    else
    {
        draw_x += string_width(draw_chr);
    }
}
}