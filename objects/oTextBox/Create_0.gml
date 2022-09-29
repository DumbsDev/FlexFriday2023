depth = -9999
#region Textbox parameters (constant)
textbox_width = 180
textbox_height = 84
border = 12
line_sep = 16
line_width = textbox_width - border*2
txtb_spr = sBackground
txtb_img = 0
txtb_img_spd = 1
#endregion

//The text!
page = 0;
page_number = 0;
text[0] = "this is a long string of text to make sure wrapping works correctly";
text[1] = "the quick brown fox jumped over the lazy dog";
text[2] = "this is a/ntest";
text[3] = "THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 0.2








;

setup = false;