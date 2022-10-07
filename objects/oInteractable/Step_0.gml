depth = -bbox_bottom;

var _s = id;

var _interact = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18 )&& _interact && !instance_exists(oTextBox)) {
	create_textbox(text_id)
}