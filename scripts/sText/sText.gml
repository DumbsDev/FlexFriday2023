// @param text
function sText(_text){

text[page_number] = _text;

page_number++;

}
//@param options
//@param link_id
function sOptions(_option,_link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

//@param text_id
function create_textbox(_text_id) {
with instance_create_layer(x,y,"Dialogue",oTextBox)
	{
		sGameText(_text_id)
	}
show_debug_message("Interacted is true");
}