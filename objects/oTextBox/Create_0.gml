#region Textbox parameters (constant)
textbox_width = 336
textbox_height = 128
border = 12
line_sep = 4
line_width = textbox_width - border*2
#endregion

//The text!
page = 0;
page_number = 0;
text[0] = "this is a long string of text to make sure wrapping works correctly";
text[1] = "yo mama";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

setup = false;