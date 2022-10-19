depth = -bbox_bottom;

var _s = id;

var _interact = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18 )&& _interact && !instance_exists(oTextBox)) {
	create_textbox(text_id)
	dailyQuestions += 1
	print(dailyQuestions)
}

if dailyQuestions < dailyQuestionsMax 
{
	if querycode == querycodelast {
		querycode = (irandom_range(1,querycodemax));
	}
}

text_id = querycode

if dailyQuestions  >= dailyQuestionsMax {
	text_id = "finalqoftheday"
}