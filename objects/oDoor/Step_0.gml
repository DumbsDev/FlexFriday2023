// Inherit the parent event
event_inherited();
var _interact = keyboard_check_pressed(vk_enter);

if ((distance_to_object(instance_nearest(x,y,oPlayer))< 18 )&& _interact && !instance_exists(oTextBox)) {
	with instance_create_layer(x,y,"Dialogue",oTextBox)
	{
		sText("It's a wooden door.");
		sText("It's locked and you dont feel like opening it.");	
	}
	show_debug_message("Interacted is true");
}
