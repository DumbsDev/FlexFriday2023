depth = -9999
#region Textbox parameters (constant)
textbox_width = 360
textbox_height = 80
border = 6
line_sep = 16
line_width = textbox_width - border*2
txtb_spr[0] = sBackground;
txtb_img = 0
txtb_img_spd = 0.2;
#endregion

//The text!
page = 0;
page_number = 0;
text[0] = "error: no sText()"
text_length[0] = string_length(text[0]); // Get how many characters on a string.

//portait!!
portrait_x_offset[0] = 4;

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

speakAmount = 0;

font_size = 0;

setup = false;

// effects
scSetDefaultsForText();
lastFreeSpace = 0;

scaleOfSpeaker = 1.875; // This is the scale of the speaker, as it doesnt fit in perfectly.
text_pause_timer = 0;
text_pause_time = 16;

// color
c_color = c_white