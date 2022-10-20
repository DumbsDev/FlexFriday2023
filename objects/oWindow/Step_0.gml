depth = -bbox_bottom;

var _s = id;

var _interact = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18 )&& _interact && !instance_exists(oTextBox)) {
	create_textbox(text_id)
	if dailyQuestions < dailyQuestionsMax 
		querycode = (irandom_range(1,querycodemax));
	if querycode = text_id {
		querycode = (text_id+(choose(-1,1)));
		}
		
	text_id = querycode;
	dailyQuestions += 1;
	print(dailyQuestions);
}

if dailyQuestions  >= dailyQuestionsMax {
	text_id = "finalqoftheday"
}