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
	sText("It's a plant in a pot.")
	break;
	
	#region bookshelf
	case "bookshelf":
	sText("It's a bookshelf.")
	sText("Would you like to read a book?")
		sOptions("Read a book", "bookshelf - yes")
		sOptions("Leave", "bookshelf - no")
	break;
	
	case "bookshelf - no":
		instance_destroy();
	break;
		
		case "bookshelf - yes":
		sText("> It is a paradox that every leader has climbed to power")
		sText("> through the ladder of free speech.Immedietly on obtaining")
		sText("> power each dictator has supressed all free speech")
		sText("> excerpt from their own.")
		sText("You close the book.")
	break;
	#endregion
	
#endregion
#region lore and tutorial
	case "tutorial":
	sText("welcome to tutorial")
	sText("this needs a lot of work lol")
		sOptions("Yes, I will", "tut - yes")
		sOptions("No I wont", "tut - no")
	break;
	
	case "tut - yes":
		sText("thanks dawg")
	break;
	
		case "tut - no":
		instance_destroy();
	break;

#endregion
#region questions and npcs

#endregion
#region misc.

#endregion
#region other

#endregion
	}
}