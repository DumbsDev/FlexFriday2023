// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sGameText(_text_id){

switch _text_id {

#region Object Interaction
	//Basic Household Objects
case "table":
	sText("It's a table.")
	sText("It's made of oak wood.")
	break;
	
case "door":
	sText("It's a door.")
	sText("You don't feel like unlocking it right now.")
	break;

case "plantpot":
	sText("It's a potted plant.")
	break;
	
	case "plantpot2":
	sText("It's a plant in a pot")
	break;
	
	case "bookshelf":
	sText("It's a bookshelf")
	break;
	
	
#endregion
#region lore and tutorial

#endregion
#region questions and npcs

#endregion
#region misc.

#endregion
#region other

#endregion
	}
}