#region keyboard and speed
accept_key = keyboard_check_pressed(ord("Z")) or 
keyboard_check_pressed(vk_enter);
var spd_key = keyboard_check(vk_control);

if spd_key {
text_spd = 1
} else {
	text_spd = 1
}
draw_set_font(global.font_main)
#endregion
#region alignment
draw_set_halign(fa_left)
draw_set_valign(fa_top)

	textbox_x = (oCamera.x - camera_get_view_border_x(view_camera[0])/3)
	textbox_y = (oCamera.y)+room_height/2-room_height*0.35;

		if (oPlayer.y <= room_height/2) {
	textbox_x = (oCamera.x)-(textbox_width/2)
	textbox_y = (oCamera.y)+room_height/2-room_height*0.35;
		} else if (oPlayer.y > room_height/2){
	textbox_x = (oCamera.x - camera_get_view_border_x(view_camera[0])/3)
	textbox_y = (((oCamera.y)+room_height/2-room_height*0.35)-(room_height/3)*2)+32;
}
#endregion
////debug size
//draw_line(textbox_x-1000,textbox_y-1,textbox_x+1000,textbox_y-1);
#region setup
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
		
		//setting individual chars and finding where they should break
		for (var ch = 0; ch < text_length[p]; ch++;) {
			var char_pos = ch+1;
			
			//store individual chars in "char" array.
			char[ch,p] = string_char_at(text[p], char_pos);
			
			//get current width of line
			var txt_up_to_char = string_copy(text[p], 1, char_pos);
			var current_text_w = string_width(txt_up_to_char) - string_width(char[ch,p]);	
			
			//get the last free space
			if char[ch,p] == " " {lastFreeSpace = char_pos+1};
			
			//get the line breaks
			if (current_text_w  - line_break_num[p] > line_width)
			{
				line_break_pos[line_break_num[p], p] = lastFreeSpace;
				line_break_num[p]++;
				var txt_up_to_last_space = string_copy(text[p], 1, lastFreeSpace);
				var last_free_space_string = string_char_at(text[p], lastFreeSpace);
				line_break_offset[p] = string_width(txt_up_to_last_space) - string_width(last_free_space_string);
			}	
		}
		
		//Getting the characters coordinates
		for (var ch = 0; ch < text_length[p]; ch++)
		{
			var char_pos = ch+1;
			var txt_x = textbox_x + text_x_offset[p] + border;
			var txt_y = textbox_y + border;
			
			//get width of current line
			var txt_up_to_char = string_copy(text[p], 1, char_pos);
			var current_text_w = string_width(txt_up_to_char) - string_width(char[ch,p]);
			var txt_line = 0;
			
			//compensate for string breaks
			for (var lb = 0; lb < line_break_num[p]; lb++)
			{
				//if the current looping character is after a line break
				if (char_pos >= line_break_pos[lb, p]) {
					var str_copy = string_copy(text[p], line_break_pos[lb,p], char_pos-line_break_pos[lb,p]);
					current_text_w = string_width(str_copy);
					
					//record the "line" this char should be on
					txt_line = lb+1 //+1 since it starts at 0
				}
			}
			
			char_x[ch,p] = txt_x + current_text_w;
			char_y[ch,p] = txt_y + txt_line*line_sep;
		}
	}
	
}
//typing the text
if draw_char < text_length[page]
{
	//increment the index of the character that's being typed
	draw_char++;
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
		//link text for options
		if option_number > 0 {
		create_textbox(option_link_id[option_pos])	
		}
	instance_destroy();	
	}
	}
	//if not done typing
	else {
	draw_char++;
	}
	}
#endregion
#region draw textbox

txtb_img += txtb_img_spd
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

//back of the textbox
draw_sprite_ext(txtb_spr,txtb_img,_txtb_x,
_txtb_y,textbox_width/txtb_spr_w,textbox_height/txtb_spr_h,
0,c_white,1);
#endregion
#region options
if draw_char == text_length[page] && page == page_number - 1 
{
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	option_pos = clamp(option_pos, 0, option_number-1);
	//timestamp is 20:00 for revision
	var _op_space = 24,
	_op_board = 18;
	for (var _op = 0; _op < option_number; _op++)
	{
		if (oPlayer.y <= room_height/2) {
	_txtb_y = (oCamera.y)+room_height/2-room_height*0.35;
		} else if (oPlayer.y > room_height/2){
	_txtb_y = (((oCamera.y)+room_height/2+room_height*0.35)-(room_height/3)*3)+48;
}
	//the option box
	var _o_w = string_width(option[_op]) +_op_board*2;
	draw_sprite_ext(txtb_spr,txtb_img,_txtb_x + 24, _txtb_y - _op_space*option_number+_op_space*_op,_o_w/txtb_spr_w, (_op_space-1)/txtb_spr_h,0,c_white,1);
	
	//the arrow
	if option_pos == _op
	{
		draw_sprite(sPointer, 0, _txtb_x, _txtb_y - _op_space*option_number+_op_space*_op);
	}
	
	//the option text
	draw_set_color(c_shadow)
	draw_text(_txtb_x+16+_op_board,_txtb_y-_op_space*option_number+_op_space*_op+5,option[_op])
	draw_set_color(c_white)
	draw_text(_txtb_x+14+_op_board,_txtb_y-_op_space*option_number+_op_space*_op+3,option[_op])
	}
}
#endregion options
#region draw ze text
//draw the text
draw_set_color(c_shadow)
var _drawtext = string_copy(text[page], 0, draw_char)
#region text shadow
draw_text_ext(
//draw the text shadow
textbox_x+2 + text_x_offset[page] + border,
textbox_y+2 + border,
_drawtext,
line_sep,
line_width);
draw_set_color(c_white)
#endregion
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border,_drawtext,line_sep,line_width);
#endregion