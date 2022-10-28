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
	
	case "cal":
	sText("It's been " + string(oPlayer.day) + " days since your reign begun.")
	break;
	
case "door":
	sText("It's a door.")
	sText("You don't feel like unlocking it right now.")
	//sText("it smells weird almost like it's alive")
	//sText("no it's taking over ")
	//sText("you move away but you feel it's apart of you")
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
	
	case "bookshelf - read":
		sText("It's a bookshelf.")
		sText("You don't really feel like reading right now.")
	break;
	
	case "bookshelf - no":
		instance_destroy();
	break;
		
		case "bookshelf - yes":
		sText("> It is a paradox that every leader has climbed to power")
		sText("> through the ladder of free speech. Immedietly")
		sText("> obtaining power each dictator has supressed")
		sText("> all free speech excerpt from their own.")
		sText("You close the book.")
			oPlayer.intel += 1
		sText("You feel a bit more wise.")
//		sText("a weird sense of someone watching washes over you")
		oBookshelf.text_id = "bookshelf - read"
	break;
	#endregion
	#region bed
		case "bed":
	sText("It's your bed.")
	sText("Would you like to end your day?")
		sOptions("Go to bed.", "bed - yes")
		sOptions("Not yet.", "bed - no")
	break;
	
	case "bed - no":
		instance_destroy();
	break;
		
		case "bed - yes":
		sText("You head to bed...")
			oPlayer.sleep = true;
	break;
	#endregion
#endregion
#region lore and tutorial

#endregion
#region questions and npcs

	case "finalqoftheday":
		sText("You have no more questions today.")
	break;
	
	case 0:
		sText("0th statement lol") //This text will be a rare test, only visible if the
	//player gets the first statement twice in a row, as well as a coinflip.
	break;
	case 1:
		sText("Hello, thyne majesty.");
		sText("Would you like to water more crops?\n(+5~) (-5@)")
		sOptions("Yes", "c1 - yes")
		sOptions("No", "c1 - no")
	break;
	case "c1 - no":
		sText("Understood, your majesty.")	
		sText("We will leave the well as it is.")
	break;
	case "c1 - yes":
		sText("Understood, your majesty.")	
		sText("We will inform the farmers of your decision.")
		oPlayer.water -= 5
		oPlayer.food += 5
	break;
	case 2:
	sText("DEF")
	break;
	case 3:
		sText("GHI")
		break;
	case 4:
		sText("JKL")
		break;
	case 5:
		sText("MNOP")
		break;
	case 6:
		sText("QRS")
		break;
	case 7:
		sText("TUV")
		break;
	case 8:
		sText("WX")
		break;
	case 9:
		sText("YZ")
		break;
	case 10:
		sText("FILLER")
		break;
	case 11:
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
	case 12:
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
	case 13:
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
	case 14:
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
	case 15:
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
#region bob

#endregion
#endregion
#region misc.
#endregion
#region other

#endregion
#region extra thing

#endregion
	}
}