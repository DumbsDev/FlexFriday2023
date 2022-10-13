depth = -bbox_bottom;

var _interact = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18) && _interact && !instance_exists(oStats)) {
	instance_create_depth(x,y,-10000,oStats)
}