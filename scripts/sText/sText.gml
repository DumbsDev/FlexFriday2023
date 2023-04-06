function scSetDefaultsForText(){
	line_break_pos[0,page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = sBackground;
	speaker_sprite[page_number] = noone; // Portrait
}






/// @param text
/// @param [chararacter - optional]
function sText(_text){
	scSetDefaultsForText()
	
	text[page_number] = _text;
	
	// get char info
	if (argument_count > 1)
	{
		switch(argument[1])
		{
			//case "adv":
				//speaker_sprite[page_number] = sAdvisor;
				//txtb_spr[page_number] = sBackgroundAdvisor;
				//break;
			//case "farmer":
				//speaker_sprite
			case "FishNormal":
				speaker_sprite[page_number] = sFish;
				txtb_spr[page_number] = sBackgroundFish;
				break;
			case "FishSad":
				speaker_sprite[page_number] = sFishSad;
				txtb_spr[page_number] = sBackgroundFish;
				break;
			// Hunter Monster used as second argument (the portrait)
			case "hunter":
				speaker_sprite[page_number] = sHunter;
				txtb_spr[page_number] = sBackgroundHunter;
				break;
			case "WaterCultist":
				speaker_sprite[page_number] = sWaterCultist;
				txtb_spr[page_number] = sBackground;
				break;
				
			// Fall back incase there is no character chosen
			default:
				speaker_sprite[page_number] = noone;
				txtb_spr[page_number] = sBackground;
				break;
		}
	}
	
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
	print("Interacted is true");
}