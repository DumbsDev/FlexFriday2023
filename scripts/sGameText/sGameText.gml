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
		sText("The easter egg is you have to interact with the plant 456 times.");
		sText("Then put a wired mouse,(plugged in), in a pool of gamer girl bathwater.");
		sText("This should unlock the second character, Tails.");
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