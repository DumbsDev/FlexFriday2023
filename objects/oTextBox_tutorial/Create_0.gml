depth = -9999
#region Textbox parameters (constant)
	textbox_width = 360
	textbox_height = 80
	border = 12
	line_sep = 18
	line_width = textbox_width - border*2
	txtb_spr = sBackground
	txtb_img = 0
	txtb_img_spd = 1
#endregion

//The text!
page = 0;
page_number = 0;
text[0] = ""
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 0.5;
//Options
option[0] = "";
option_link_id[0] = -1
option_pos = 0;
option_number = 0;

setup = false;