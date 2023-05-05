#region Define Key Input Variables
var _up = keyboard_check(ord("W")) or keyboard_check(vk_up),
_down = keyboard_check(ord("S")) or keyboard_check(vk_down),
_left = keyboard_check(ord("A")) or keyboard_check(vk_left),
_right = keyboard_check(ord("D")) or keyboard_check(vk_right),
_esc = keyboard_check(vk_delete) or keyboard_check(vk_escape),
_reset = keyboard_check_pressed(ord("R"));
#endregion
#region Movement
if _up {
	yy -= moveSpeed*1.25
	
}
if _down {
	yy += moveSpeed*1.25
}
if _left {
	xx -= moveSpeed*1.25
	xsc = -1
}
if _right {
	xx += moveSpeed*1.25
	xsc = 1
}

y = lerp(y,yy,la);
x = lerp(x,xx,la);
#endregion Movemen
#region interact
//if ((distance_to_object(instance_nearest(x,y,oInteractable))< 18 )&& _interact && !instance_exists(oTextBox)) {
//	var _s = oInteractable._s
//	var text_id = oInteractatext_id
//	with instance_create_layer(x,y,"Dialogue",oTextBox)
//	{
//	sGameText(_s.text_id);
//	}
//	show_debug_message("Interacted is true");
//}
#endregion
#region movement with dialogue boxes
if instance_exists(oTextBox) {
moveSpeed = 0;	
} else {
moveSpeed = 2;
}
#endregion
#region depth ordering
depth = -bbox_bottom;
#endregion
#region deactivate instances outside player

#endregion
#region sleep
if sleep = true {
	global.day += 1
ini_open("savedata.ini"); //Set the save data
ini_write_real("savedata", "day", global.day); //set the current day
ini_write_real("savedata", "water", global.water); //set the current day
ini_write_real("savedata", "food", global.food); //set the current day
ini_write_real("savedata", "houses", global.houses); //set the current day
ini_read_real("savedata", "population", global.population); //set the current day
ini_write_real("savedata", "intel", global.intel); //set the intelligence
ini_write_real("savedata", "joy", global.joy); //set the intelligence
ini_write_real("savedata", "gold", global.gold); //set the gold
ini_write_real("savedata", "taxrate", global.taxrate); //set the taxrate

ini_write_real("savedata", "waterCultRep", global.waterCult); //set the waterCult rep
ini_write_real("savedata", "farmersUnionRep", global.farmersUnion); //set the farmersUnion rep
ini_write_real("savedata", "emperorsCourtRep", global.emperorsCourt); //set the emperorsCourt rep
ini_close(); //close the ini file to prevent a memory leak
room_goto(rm_endday)
}
#endregion