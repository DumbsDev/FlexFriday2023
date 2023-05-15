function sGameText(_text_id){
	dayMulti = global.day / 10 + 1
	print(string(_text_id))
/*
@ = water
~ = food
* = happiness
% = housing
$  = gold coin
| = population
*/
hntr = "hunter";
frm = "farmer";
fsh = "FishNormal";
fshs = "FishSad";
wc = "WaterCultist";
adv = "adv"

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
		print("sText loads...")
		sOptions("Read a book", "bookshelf - yes")
		print("sOptions Loads...")
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
			sText("Hey, welcome, you are the new monarch of this land!",adv)
			sText("I am your royal advisor!",adv)
			sText("People are going to come and ask questions for you,",adv)
			sText("sometimes you will be able to answer, sometimes you wont.",adv)
			sText("When you can respond to someone",adv)
			sText("something will show up when they are done talking.",adv)
			sText("Kind of like this!",adv)
			sOptions("I see!", "tut1 - Confirm",adv)
			sOptions("I dont understand.", "tut1 - Deny",adv)
			break;
		
		case "tut1 - Confirm":
			sText("Awesome, you can view all of your stats in the main room",adv);
			sText("(that room is to your right, there should be a journal!)",adv);
			sText("you can also go to the room on your right",adv);
			sText("thats all for now",adv);
			sText("come back to this table to get your questions and letters.",adv);
			break;
		
		case "tut1 - Deny":
			sText("Well, basically you are the boss here",adv)
			sText("and you control a city",adv)
			sText("By answering questions and managing resources.",adv)
			sOptions("I see!", "tut1 - Confirm");
			sOptions("Wait, restart! Huh?", -5);
			break;
#endregion
#region questions and npcs

		case "finalqoftheday":
			sText("You have no more questions today.")
			break;
	
		case 0:
			dialogueReturnArray = dialogueGenerator("","", true)
			dialogue = dialogueReturnArray[0]
			global.improvedStat = dialogueReturnArray[1]
			global.reducedStat = dialogueReturnArray[2]
			global.magnitude = dialogueReturnArray[3]
			sText(dialogue,adv)
			sOptions("Yes", "c0 - yes")
			sOptions("No", "c0 - no")
			break

		case "c0 - yes":
			show_message("you said yes and it worked kinda")
			sText("Great, Sire, I'll go right ahead with that!",adv)
			improveStat(global.improvedStat, global.magnitude)
			reduceStat(global.reducedStat, global.magnitude)
			break

		case "c0-no":
			sText("Okay, Sire, I understand.",adv)
			break
			
		
		case 1:
			sText("Hello, thyne majesty.", wc);
			sText("Would you like to trade water for food? (+5~) (-5@)", wc)
			sOptions("Yes", "c1 - yes")
			sOptions("No", "c1 - no")
			break;
		
		case "c1 - no":
			sText("Understood, your majesty.", wc)	
			sText("We will leave the well as it is.", wc)
			break;
		
		case "c1 - yes":
			sText("Understood, your majesty.", wc)	
			sText("We will inform the occult of your decision.", wc)
			global.water -= 5 * dayMulti
			global.food += 5
			break;
		
		case 2:
			sText("It rained last night,",,adv)
			sText("meaning our water reserves are filled! (+10@)",,adv)
			global.water += 10;
			break;
		
		case 3:
			if oWindow.huntingInOurTerritory == false {
				sText("Hey, you're hunters have been hunting on our land.", hntr)
				sText("And as a group of hunting monsters,", hntr)
				sText("We ain't too big fans.", hntr)
				sText("Could you condense your hunting to your land?", hntr)
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
			sText("Oh really? We thank you deeply!", hntr)
			sText("I know its not crazy important, but still", hntr)
			sText("We thank you.", hntr)
			oWindow.oneIsOffTheHuntersLand = 1
			break;
			
		case "huntingInOurTerritory - no":
			sText("Really? \ You go on our land...", hntr)
			sText("We'll fight back!", hntr)
			oWindow.oneIsOffTheHuntersLand = 2
			break;
			
		case 4:
			dialogueReturnArray = dialogueGenerator("","", true)
			dialogue = dialogueReturnArray[0]
			global.improvedStat = dialogueReturnArray[1]
			global.reducedStat = dialogueReturnArray[2]
			global.magnitude = dialogueReturnArray[3]
			sText(dialogue,,adv)
			sOptions("Yes", "c4 - yes")
			sOptions("No", "c4 - no")
			break;

		case "c4 - yes":
			sText("Great, Sire, I'll go right ahead with that!",adv)
			improveStat(global.improvedStat, global.magnitude)
			reduceStat(global.reducedStat, global.magnitude)
			break;

		case "c4 - no":
			sText("Okay, Sire, I understand.",adv)
			break;
		
		case 5:
			sText("We wanna start a new endurance test to see how long we can hold our breaths!", fsh)
			sText("Can we?", fsh)
			sOptions("Yes", "c5 - yes")
			sOptions("Hell no!", "c5 - no")
			break;
		
		case "c5 - yes":
			sText("I'll will tell them that the no breath challenge is fully endorsed by the ruler!", fsh)
			global.population = round(global.population * 0.975);
			break;
		
		case "c5 - no":
			sText("Aw, womp womp.", fshs)
			break;
			
		case 6:
			sText("People aren't paying their taxes what should we do about it?",adv)
			sOptions("Punish them!", "c6 - Commie")
			sOptions("Lower the taxes", "c6 - Lower")
			sOptions("Let it be", "c6 - Nothing")
			break
			
		case "c6 - Commie":
			sText("I will have them whipped right away!",adv)
			break;
		
		case "c6 - Lower":
			sText("I will have them do that right away!",adv)
			global.gold = global.gold * 0.9
			break;
		
		case "c6 - Nothing":
			sText("oh-Okay?",adv)
			global.gold = global.gold * 0.8
			break;
		
		case 7:
			global.faction = pickRandomFaction()
			dialoguePackage = pickRandomFactionDialogue(global.faction)
			dialogue = dialoguePackage[0]
			global.dialogueIndex = dialoguePackage[1]
			global.responses = dialoguePackage[2]

			sText(dialogue)

			for (var i = 0; i < array_length(global.responses); i++) {
				sOptions(global.responses[i], "c7 - " + string(i))
			}
			break;
		
		case "c7 - 0":
			interpretedPlayerResponse = interpretPlayerResponse(global.faction, global.dialogueIndex, global.responses[0])
			improvedAndReducedStats = [interpretedPlayerResponse[0], interpretedPlayerResponse[1]]
			factionResponse = interpretedPlayerResponse[2]
			
			sText(factionResponse)

			updateFactionStats(global.faction, improvedAndReducedStats[0], improvedAndReducedStats[1])
			break;
		
		case "c7 - 1":
			interpretedPlayerResponse = interpretPlayerResponse(global.faction, global.dialogueIndex, global.responses[1])
			improvedAndReducedStats = [interpretedPlayerResponse[0], interpretedPlayerResponse[1]]
			factionResponse = interpretedPlayerResponse[2]
			
			sText(factionResponse)

			updateFactionStats(global.faction, improvedAndReducedStats[0], improvedAndReducedStats[1])
			break;
		
		case "c7 - 2":
			interpretedPlayerResponse = interpretPlayerResponse(global.faction, global.dialogueIndex, global.responses[2])
			improvedAndReducedStats = [interpretedPlayerResponse[0], interpretedPlayerResponse[1]]
			factionResponse = interpretedPlayerResponse[2]
			
			sText(factionResponse)
			
			updateFactionStats(global.faction, improvedAndReducedStats[0], improvedAndReducedStats[1])
			break;
		#endregion
	}
}