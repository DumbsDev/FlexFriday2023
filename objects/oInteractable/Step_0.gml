depth = -bbox_bottom;

var _s = id;

var _interact = keyboard_check_pressed(vk_enter);

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18 )&& _interact && !instance_exists(oTextBox)) {
	with instance_create_layer(x,y,"Dialogue",oTextBox)
	{
	sGameText(_s.text_id)
	}
	show_debug_message("Interacted is true");
}
