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
case "rnpc":
	var dialogue = ""
	var randimprove = random(2)
	var randreduce = random(2)
	while randimprove == randreduce {
		randreduce = random(2)
	}
	
		switch (randimprove){
			case 0:
				dialogue += "Would you like to increase our food supply by "
				break
			case 1:
				dialogue += "Would you like to increase our kingdom's wealth by "
				break
			case 2:
				dialogue += "Would you like to increase our kingdom's happiness by "
				break
			default:
				show_debug_message("Error on line 118 of sGameText")
				break
		}
	
		switch (randreduce){
			case 0:
				if (randimprove = 1){
					if (random(1) == 0){
						dialogue += "selling our crops to a neighboring kingdom?"
					} else {
						dialogue += "increasing taxes on crops?"
					}
				} else if (randimprove == 2) {
					if (random(1) == 0){
						dialogue += "increasing rations?"
					} else {
						dialogue += "hold a feast for the commonwealth?"
					}
				}
				break
			case 1:
				if (randimprove == 0){
					if (random(1) == 0){
						dialogue += "purchasing food from our neighboring kingdom?"
					} else {
						dialogue += "reducing taxes on crops?"
					}
				} else if (randimprove == 2) {
					if (random(1) == 0){
						dialogue += "advertising for a carnival to come to the kingdom?"
					} else {
						dialogue += "build a theater in the town square?"
					}
				}
				break
			case 2:
				if (randimprove == 1){
					if (random(1) == 0){
						dialogue += "reducing rations?"
					} else {
						dialogue += "demanding more food from farmers?"
					}
				} else if (randimprove == 0){
					if (random(1) == 0){
						dialogue += "invading a nearby kingdom for it's resources?"
					} else {
						dialogue += "stoping maintaining public works?"
					}
				}
				break
			default:
				show_debug_message("Error on line 169 of sGameText")
				break
		}
break;
#endregion
#region misc.

#endregion
#region other

#endregion
	}
}