// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sGameText(_text_id){
	dayMulti = global.day / 10 + 1
/*
@ = water
~ = food
* = happiness
% = housing
$  = gold coin
| = population
*/


switch _text_id {

#region Object Interaction
	//Basic Household Objects
	case "table":
		sText("It's a table.")
		sText("It's made of oak wood.")
		break;
	
	case "cal":
		sText("It's been " + string(global.day) + " days since your reign begun.")
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
			sText("> through the ladder of free speech. Immedietly")
			sText("> obtaining power each dictator has supressed")
			sText("> all free speech excerpt from their own.")
			sText("You close the book.")
			global.intel += 1
			sText("You feel a bit more wise.")
	//		sText("a weird sense of someone watching washes over you")
			oBookshelf.text_id = "bookshelf - read"
			break;
		
		case "bookshelf - read":
			sText("It's a bookshelf.")
			sText("You don't really feel like reading right now.")
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
			ini_open("savedata.ini")
			oPlayer.sleep = true;
			ini_close();
			break;
	#endregion
#endregion
#region lore and tutorial
		case -5:
			sText("Hey, welcome, you are the new monarch of this land!")
			sText("I am your royal advisor!")
			sText("People are going to come and ask questions for you,")
			sText("sometimes you will be able to answer,\nsometimes you wont.")
			sText("When you can respond to someone")
			sText("something will show up when they are done talking.")
			sText("Kind of like this!")
			sOptions("I see!", "tut1 - Confirm")
			sOptions("I dont understand.", "tut1 - Deny")
			break;
		
		case "tut1 - Confirm":
			sText("Awesome, you can view all of your stats in the main room");
			sText("(that room is to your left!)");
			sText("you can also go to the room on your right");
			sText("to see your colony!");
			sText("thats all for now");
			sText("come back to this window to get your questions!");
			break;
		
		case "tut1 - Deny":
			sText("Well, basically you are the boss here")
			sText("and you control a city!")
			sText("By answering questions and managing resources.")
			sOptions("I see!", "tut1 - Confirm");
			sOptions("Wait, restart! Huh?", -5);
			break;
#endregion
#region questions and npcs

		case "finalqoftheday":
			sText("You have no more questions today.")
			break;
	
		case 0:
			dialogueGenerator(randomizeInput=true)
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
			global.water -= 5 * dayMulti
			global.food += 5
			break;
		
		case 2:
			sText("It rained last night,")
			sText("meaning our water reserves are filled! (+10@)")
			global.water += 10
			break;
		
		case 3:
			if oWindow.huntingInOurTerritory == false {
				sText("Hey, you're hunters have been hunting on our land.")
				sText("And as a group of hunting monsters,")
				sText("We ain't too big fans.")
				sText("Could you condense your hunting to your land?")
				oWindow.huntingInOurTerritory = true
				sOptions("Sure, we'll move!","huntingInOurTerritory - yes")
				sOptions("You snooze, you lose.","huntingInOurTerritory - no")
			}	else if (oWindow.huntingInOurTerritory == true && oWindow.oneIsOffTheHuntersLand = 1) {
				sText("Our hunters found a hidden place on our land");
				sText("and its ridden with berries! (+10~)");
			}	else if (oWindow.huntingInOurTerritory == true && oWindow.oneIsOffTheHuntersLand = 2) {
				sText("We went hunting on the hunters land again.")
				sText("We got some food...")
				sText("But not before they killed some of our hunters.")
				global.population -= irandom_range(1,3);
				global.food += 5;
			}
			break;
		
		case "huntingInOurTerritory - yes":
			sText("Oh really?\nThank you deeply!")
			sText("I know its not crazy important, but still")
			sText("We thank you.")
			oWindow.oneIsOffTheHuntersLand = 1
			break;
			
		case "huntingInOurTerritory - no":
			sText("Really?\nYou go on our land...")
			sText("We'll fight back!")
			oWindow.oneIsOffTheHuntersLand = 2
			break;
			
		case 4:
			dialogueGenerator("", "", true)
			break;
		
		case 5:
			sText("The locals have started a new endurance test to see how long they can hold their breaths!")
			sText("Should we let them?")
			sOptions("Yes!", "5-1")
			sOptions("What is wrong with you, no!", "5-2")
			break;
		
		case "5-1":
			sText("We will tell them that the no breath challenge is fully endorsed by the ruler!")
			global.population = round(global.population * 0.975);
			break;
		
		case "5-2":
			sText("that is surely a good idea leader!")
			break;
			
		case 6:
			sText("People aren't paying their taxes what should we do about it?")
			sOptions("Punish them!", "6-Commie")
			sOptions("Lower the taxes", "6-Lower")
			sOptions("Let it be", "6-Nothing")
			
		case "6-Commie":
			sText("I will have them whipped right away!")
			break;
		
		case "6-Lower":
			sText("I will have them do that right away!")
			global.gold = global.gold * 0.9
			break;
		
		case "6-Nothing":
			sText("Uh-Okay?")
			global.gold = global.gold * 0.8
		
		case 7:
			dialogueReturnArray = dialogueGenerator("","", true)
			dialogue = dialogueReturnArray[0]
			improvedStat = dialogueReturnArray[1]
			reducedStat = dialogueReturnArray[2]
			magnitude = dialogueReturnArray[3]
			sOptions("Yes", "7-yes")
			sOptions("No", "7-no")
			break

		case "7-yes":
			sText("Great, Sire, I'll go right ahead with that!")
			break

		case "7-no":
			sText("Okay, Sire, I understand.")
			break
		
		case 8:
			dialogueReturnArray = dialogueGenerator("","", true)
			dialogue = dialogueReturnArray[0]
			improvedStat = dialogueReturnArray[1]
			reducedStat = dialogueReturnArray[2]
			magnitude = dialogueReturnArray[3]
			sOptions("Yes", "8-yes")
			sOptions("No", "8-no")
			break

		case "8-yes":
			sText("Great, Sire, I'll go right ahead with that!")
			break

		case "8-no":
			sText("Okay, Sire, I understand.")
			break
		
		case 9:
			dialogueReturnArray = dialogueGenerator("","", true)
			dialogue = dialogueReturnArray[0]
			improvedStat = dialogueReturnArray[1]
			reducedStat = dialogueReturnArray[2]
			magnitude = dialogueReturnArray[3]
			sOptions("Yes", "9-yes")
			sOptions("No", "9-no")
			break

		case "9-yes":
			sText("Great, Sire, I'll go right ahead with that!")
			break

		case "9-no":
			sText("Okay, Sire, I understand.")
			break
	}
}