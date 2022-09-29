accept_key = keyboard_check_pressed(ord("Z")) or 
keyboard_check_pressed(vk_enter);
var spd_key = keyboard_check(vk_control);

if spd_key {
text_spd = 1
} else {
	text_spd = 0.2
}

textbox_x = camera_get_view_border_x(view_camera[0]);
textbox_y = camera_get_view_border_y(view_camera[0])+96;

////debug size
//draw_line(textbox_x-1000,textbox_y-1,textbox_x+1000,textbox_y-1);

//setup
if setup == false {
	
	setup = true;
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through the pages
	page_number = array_length(text);
	
	for (var p = 0; p < page_number; p++)
	{
		//find out how many characters on per page and store that
		//number in the "text_length[]" array.
		text_length[p] = string_length(text[p]);
		
	//get the x position for the textbox
		//no character (center box)	
		text_x_offset[p] = 48;
		
	}
	
}
//typing the text
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char,0,text_length[page]);
	
}
//flip through pages
if accept_key
{
//if the typing is done
	if draw_char == text_length[page]
	{
	//next page
	if page < page_number-1
	{
		page++;
		draw_char = 0;
	}
	//destroy textbox
	else
	{
	instance_destroy();	
	}
	}
	//if not done typing
	else {
	draw_char = text_length[page];	
	}
	}

//draw the textbox
#region draw textbox
txtb_img += txtb_img_spd
txtb_spr_w= sprite_get_width(txtb_spr)
txtb_spr_h= sprite_get_height(txtb_spr)

//back of the textbox
draw_sprite_ext(txtb_spr,txtb_img,textbox_x + text_x_offset[page],
textbox_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,
0,c_white,1);
#endregion

//draw the text
draw_set_color(c_white)
var _drawtext = string_copy(text[page], 1, draw_char)
draw_text_ext(
//draw the x start of the text
textbox_x + text_x_offset[page] + border,
textbox_y + border,
_drawtext,
line_sep,
line_width);