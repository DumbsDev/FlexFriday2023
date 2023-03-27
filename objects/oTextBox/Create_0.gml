depth = -9999
#region Textbox parameters (constant)
textbox_width = 360
textbox_height = 80
border = 6
line_sep = 8
line_width = textbox_width - border*2
txtb_spr = sBackground
txtb_img = 0
txtb_img_spd = 1
#endregion

//The text!
page = 0;
page_number = 0;
text[0] = "error: no sText()"
text_length[0] = string_length(text[0]); // Get how many characters on a string.

char[0,0] = "" //Cycle through characters on page
char_x[0,0] = 0;
char_y[0,0] = 0;
draw_char = 0;
text_spd = 1;
//Options
option[0] = "";
option_link_id[0] = -1
option_pos = 0;
option_number = 0;

setup = false;

// effects
scSetDefaultsForText();
lastFreeSpace = 0;