function dialogueGenerator(improvedStat, reducedStat, randomizeInput=false){
	var dialogue = ""
	
	if randomizeInput{
		impRand = choose(0, 1, 2, 3)
		print(string(impRand))
		switch impRand{
			case 0:
				improvedStat = "food"
				break;
			case 1:
				improvedStat = "money"
				break;
			case 2:
				improvedStat = "happiness"
				break;
			case 3:
				improvedStat = "water"
				break;
			default:
				print("BIG DEFAULT ON LINE 19 OF scDIALOGUE")
		}
		correctReducedStat = false
		while not correctReducedStat{
			reducedRand = choose(0, 1, 2, 3)
			switch reducedRand{
				case 0:
					reducedStat = "food"
					break;
				case 1:
					reducedStat = "money"
					break;
				case 2:
					reducedStat = "happiness"
					break;
				case 3:
					reducedStat = "water"
					break;
				default:
					print("BIG PROBLEM ON LINE 32 OF scDIALOGUE")
			}
			if reducedRand != impRand{
				correctReducedStat = true
			}
		}
	}
	
	switch (improvedStat){
		case "food":
			dialogue += "Would you like to increase our food supply by "
			break;
		case "money":
			dialogue += "Would you like to increase our kingdom's wealth by "
			break;
		case "happiness":
			dialogue += "Would you like to increase our kingdom's happiness by "
			break;
		case "water":
			dialogue += "Would you like to improve our kingdom's water supply by "
			break;
		default:
			show_debug_message("Incorrect improvedStat value in dialogueGenerator function")
			break;
	}
	
	switch (reducedStat){
		case "food":
			randomNum = choose(0, 1)
			if (improvedStat == "money"){
				if randomNum == 0{
					dialogue += "selling our crops to a neighboring kingdom?"
				} else {
					dialogue += "increasing taxes on crops?"
				}
			} else if improvedStat == "happiness"{
				if randomNum == 0{
					dialogue += "increasing rations?"
				} else {
					dialogue += "holding a feast for the commonwealth?"
				}
			} else if improvedStat == "water"{
				if randomNum == 0{
					dialogue += "decreasing water budgeted towards watering crops?"
				} else {
					dialogue += "trading our food for water from another kingdom?"
				}
			}
			break;

		case "money":
			randomNum = choose(0, 1)
			if (improvedStat == "food"){	
				if randomNum == 0{
					dialogue += "purchasing food from our neighboring kingdom?"
				} else {
					dialogue += "reducing taxes on crops?"
				}
			} else if improvedStat == "happiness"{
				if randomNum == 0{
					dialogue += "advertising for a carnival to come to the kingdom?"
				} else {
					dialogue += "building a theater in the town square?"
				}
			} else if improvedStat == "water"{
				if randomNum == 0{
					dialogue += "building more water storage?"
				} else {
					dialogue += "buying water from another kingdom?"
				}
			}
			break;

		case "happiness":
			randomNum = irandom_range(0, 1)
			if (improvedStat == "food"){
				if randomNum == 0{
					dialogue += "reducing rations?"
				} else {
					dialogue += "demanding more food from farmers?"
				}
			} else if improvedStat == "money"{
				if randomNum == 0{
					dialogue += "invading a nearby kingdom for it's resources?"
				} else {
					dialogue += "stoping maintaining public works?"
				}
			} else if improvedStat == "water"{
				if randomNum == 0{
					dialogue += "reducing water for people to consume?"
				} else {
					dialogue += "shuting down the town square fountain?"
				}
			}
			break;
		
		case "water":
			randomNum = irandom_range(0, 1)
			if improvedStat == "food"{
				if randomNum == 0{
					dialogue += "increasing water budgeted for crops?"
				} else {
					dialogue += "trading water for food?"
				}
			} else if improvedStat == "money"{
				if randomNum == 0{
					dialogue += "selling water to another kingdom?"
				} else {
					dialogue += "ending maintainence of some water storage?"
				}
			} else if improvedStat == "happiness"{
				if randomNum == 0{
					dialogue += "increasing water for comsumption?"
				} else {
					dialogue += "starting a large fountain around town?"
				}
			}
			break;
			
		default:
			show_debug_message("Invalid reducedStat parameter")
			break;
	}
magnitude = 15
returnArray = [dialogue, improvedStat, reducedStat, magnitude]
return returnArray
}

function pickRandomFaction(){
	randomNum = choose(0, 1, 2)
	switch randomNum{
		case 0:
			faction = "water cult"
			break;
		case 1:
			faction = "farmers union"
			break;
		case 2:
			faction = "emperors court"
			break;
		default:
			show_debug_message("Invalid randomNum value in pickRandomFactionDialogue function")
			break;
	}	
	return "farmers union"
}

function pickRandomFactionDialogue(faction){
	//create variables
	dialogue = ""
	responses = []
	randomNum = choose(0, 1, 2, 3)

	switch faction{
		

		case "water cult":
			switch randomNum{
				case 0:
					//set dialogue
					dialogue = "I am a representative of the water cult. We would like to sacrifice cows to the water god. We want to do it in the town square."
					responses = ["I will allow it.", "I will not allow it to happen in the town square.", "I will not allow it to happen."]
					break
				case 1:
					dialogue = "I am a representative of the water cult. We want more water to do rituals."
					responses = ["I will give you water from our reserves for crops", "I will give you water out of our general supply.", "We cannot give you any water."]
					break
				case 2:
					dialogue = "I am from the water cult. We want to hold a celebration in the kingdom and would like your sponsorship."
					responses = ["I will allow it and pay for it.", "I will allow it but I refuse to pay for it", "I will not allow it."]
					break
				case 3:
					dialogue = "I am from the water cult. We want to build another temple in the kingdom."
					responses = ["I will give you gold from our treasury.", "I will tax the people and give you gold from that.", "We cannot give you any gold."]
					break
				default:
					show_debug_message("Invalid randomNum value in pickRandomFactionDialogue function")
					break
			}
			break

		
		case "farmers union":
			switch randomNum{
				case 0:
					dialogue = "I am a representative of the farmers union. We don't have enough water to irrigate our crops. Could you help us?"
					responses = ["I will give you water from the public supply", "I will give you some of the water held in reserve", "I can't give you any water right now."]
					break;
				case 1:
					dialogue = "I am a representative of the farmers union. We would like to recruit more farmers from another kingdom. Could you get us some protection for the journey?"
					responses = ["I can't spare any of my men but I could fund a private escort", "I will give you protection for the journey.",  "I can't help you."]
					break;
				case 2:
					dialogue = "I am from the farmers union. We have a massive surplus of food. What should we do with it?"
					responses = ["I believe the people should have the surplus.", "We should store the food for a later day.", "We should trade the food for more gold."]
					break;
				case 3:
					dialogue = "I am from the farmers union. All the trades I have sent to other kingdoms have been intercepted and robbed. Could you help me?"
					responses = ["The next time this happens, tell them you are under my protection.", "I can't protect your routes but I will reimburse you for the lost resources.", "I can't help you."]
					break;
				default:
					show_debug_message("Invalid randomNum value in pickRandomFactionDialogue function")
					break;
			}
			break;

		case "emperors court":
			switch randomNum{
				case 0:
					dialogue = "I am a representative of the emperors court. We would like to hold a fair in your kingdom. Can you approve?"
					responses = ["I approve. I can also supply food for the fair.", "I approve.", "I can't approve that right now."]
					break;
				case 1:
					dialogue = "I am a representative of the emperors court. The emporor wants to promote more arts in the land. Could you help?"
					responses = ["I will finance more artists in the kingdom.", "I will charter artists from other kingdoms.", "We can't do this right now."]
					break;
				case 2:
					dialogue = "I am a representative of the emperors court. A nearby kingdom is in need of aid after a disaster. Could you help them?"
					responses = ["I will send everything I can.", "I can send gold from the treasury.", "We don't have the means to help."]
					break;
				case 3:
					dialogue = "I am a representative of the emperors court. The emperor is asking for a tribute from every kingdom."
					responses = ["I will send as much gold as I can muster.", "I'll send some of the gold from the treasury.", "I can't send any gold right now."]
					break;
			}
			break


		default:
			show_debug_message("Invalid faction parameter in pickRandomFactionDialogue function")
			break
	}
	dialogueIndex = randomNum
	return [dialogue, dialogueIndex, responses]
}

function interpretPlayerResponse(faction, dialogueIndex, response){
	//create variables
	improvedStats = []
	reducedStats = []

	switch faction{

		case "water cult":

			switch dialogueIndex{

				case 0:

					switch response{

						case "I will allow it.":
							improvedStats = ["big rep"]
							reducedStats = ["happiness", "small food"]
							factionResponse = "Thank you, sire, we will sacrifice the cows in the town square."
							break

						case "I will not allow it to happen in the town square.":
							improvedStats = ["small rep"]
							reducedStats = ["small food"]
							factionResponse = "Fine, sire, we will do it in the forest."
							break

						case "I will not allow it to happen.":
							improvedStats = []
							reducedStats = ["small rep"]
							factionResponse = "Sire, this is a grave error. The gods must be appeased."
							break

						default:
							show_debug_message("Invalid response parameter in interpretPlayerResponse function")
							break
					}
					break
				
				case 1:

					switch	response{

						case "I will give you water from our reserves for crops":
							improvedStats = ["rep"]
							reducedStats = ["food"]
							factionResponse = "Thank you, sire, water is much needed for our rituals."
							break
						
						case "I will give you water out of our general supply.":
							improvedStats = ["rep"]
							reducedStats = ["water"]
							factionResponse = "Thank you, sire, water is much needed for our rituals."
							break
						
						case "We cannot give you any water.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "When the water god's wrath comes upon us, you will be the first to suffer."
							break
					}
					break

				case 2:
					switch response{

						case "I will allow it and pay for it.":
							improvedStats = ["rep", "happiness"]
							reducedStats = ["big gold"]
							factionResponse = "Thank you for this. You will not regret it."
							break

						case "I will allow it but I refuse to pay for it":
							improvedStats = ["happiness"]
							reducedStats = ["rep"]
							factionResponse = "We won't cancel the event because of this but we are disappointed by your decision."
							break

						case "I will not allow it.":
							improvedStats = []
							reducedStats = ["small rep"]
							factionResponse = "You should be ashamed of yourself, depriving your people of a celebration."
							break

						default:
							show_debug_message("Invalid response parameter in interpretPlayerResponse function")
							break
					}
					break

				case 3:
					switch response{

						case "I will give you gold from our treasury.":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							factionResponse = "Thank you for your eternal generosity."
							break

						case "I will tax the people and give you gold from that.":
							improvedStats = ["rep"]
							reducedStats = ["happiness"]
							factionResponse = "Thank you for your eternal generosity."
							break

						case "We cannot give you any gold.":
							improvedStats = []
							reducedStats = ["small rep"]
							factionResponse = "You should be ashamed of yourself."
							break

						default:
							show_debug_message("Invalid response parameter in interpretPlayerResponse function")
							break
					}
					break

				default:
					show_debug_message("Invalid dialogue parameter in interpretPlayerResponse function")
					break
			}
			break

		case "farmers union":

			switch dialogueIndex{

				case 0:

					switch response{

						case "I will give you water from the public supply":
							improvedStats = ["rep"]
							reducedStats = ["happiness"]
							factionResponse = "Thank you, sire, food is much more important to the people than water."
							break;

						case "I will give you some of the water held in reserve":
							improvedStats = ["rep"]
							reducedStats = ["water"]
							factionResponse = "Thank you, sire, food is much more important than water."
							break;

						case "I can't give you any water right now.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "We would have really appreciated that water."
							break;
					}
					break;
				
				case 1:
				
					switch response{

						case "I can't spare any of my men but I could fund a private escort":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							factionResponse = "Thank you, sire, we will send off right away."
							break;

						case "I will give you protection for the journey.":
							improvedStats = ["rep"]
							reducedStats = ["small population", "small food"]
							factionResponse = "Thank you, sire, we will send off right away."
							break;

						case "I can't help you.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "We would have really appreciated some protection."
							break;
					}
					break;
				
				case 2:

					switch response{

						case "I believe the people should have the surplus.":
							improvedStats = ["happiness"]
							reducedStats = []
							factionResponse = "Thank you, sire, we will make sure the people get their fair share."
							break;

						case "We should store the food for a later day.":
							improvedStats = ["food"]
							reducedStats = []
							factionResponse = "Good idea, sire, very important to stockpile resources."
							break;
						
						case "We should trade the food for more gold.":
							improvedStats = ["gold"]
							reducedStats = []
							factionResponse = "Good idea, sire, gold makes the world go round."
							break;
					}
					break;
				
				case 3:

					switch response{

						case "The next time this happens, tell them you are under my protection.":
							improvedStats = ["rep"]
							reducedStats = ["small happiness"]
							factionResponse = "Thank you, sire, this is much needed."
							break;

						case "I can't protect your routes but I will reimburse you for the lost resources.":
							improvedStats = ["rep"]
							reducedStats = ["small gold"]
							factionResponse = "Thank you, sire, though I may lose buisness, it is good to have this guarantee."
							break;

						case "I can't help you.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "I understand, sire."
							break;
					}
					break;
				
				default:
					show_debug_message("Invalid dialogueIndex parameter in interpretPlayerResponse function")
					break
			}
			break;

		case "emperors court":
			switch dialogueIndex{
				case 0:
					switch response{
						case "I approve. I can also supply food for the fair.":
							improvedStats = ["rep", "happiness"]
							reducedStats = ["food", "gold"]
							factionResponse = "Thank you, we will make preparations right away."
							break;
						
						case "I approve.":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							factionResponse = "Thank you, we will make preparations right away."
							break;
						
						case "I can't approve that right now.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "The emperor will understand."
							break;
					}
					break;
				
				case 1:
					switch response{
						case "I will finance more artists in the kingdom.":
							improvedStats = ["rep", "happiness"]
							reducedStats = ["big gold"]
							factionResponse = "Thank you, you also understand the beauty of art."
							break;
						
						case "I will charter artists from other kingdoms.":
							improvedStats = ["small rep", "small happiness"]
							reducedStats = ["gold"]
							factionResponse = "Thank you, you also understand the beauty of art."
							break;
						
						case "We can't do this right now.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "The emperor will understand."
							break;
					}
					break;
				
				case 2:
					switch response{
						case "I will send everything I can.":
							improvedStats = ["big rep"]
							reducedStats = ["gold", "food", "water"]
							factionResponse = "Thank you, I will tell the emperor immediately."
							break;
						
						case "I can send gold from the treasury.":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							factionResponse = "Thank you, I will inform the emperor."
							break;

						case "We don't have the means to help.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "The emperor will understand."
							break;
					}
					break;
				
				case 3:
					switch response{
						case "I will send as much gold as I can muster.":
							improvedStats = ["big rep"]
							reducedStats = ["big gold"]
							factionResponse = "Thank you, I will inform the emperor."
							break;
						
						case "I'll send some of the gold from the treasury.":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							factionResponse = "Thank you, I will inform the emperor."
							break;
						
						case "I can't send any gold right now.":
							improvedStats = []
							reducedStats = ["rep"]
							factionResponse = "The emperor will understand."
							break;
					}
					break;
			}
			break;


		default:
			show_debug_message("Invalid faction parameter in interpretPlayerResponse function")
			break
	}
	return [improvedStats, reducedStats, factionResponse]
}

function updateFactionStats(faction, improvedStats, reducedStats){
	//update stats
	for (var i = 0; i < array_length(improvedStats); i++){
		factionChangeAmount = 10
		statChangeAmount = 15

		if string_count(improvedStats[i], "small") == 1{
			factionChangeAmount = 5
			statChangeAmount = 7
			improvedStats[i] = string_delete(improvedStats[i], 1, 5)
		} else if string_count(improvedStats[i], "big") == 1{
			factionChangeAmount = 20
			statChangeAmount = 30
			improvedStats[i] = string_delete(improvedStats[i], 1, 3)
		}

		if improvedStats[i] != "rep"{
			improveStat(improvedStats[i], statChangeAmount)
		} else {
			improveFaction(faction, factionChangeAmount)
		}
	}

	for (var i = 0; i < array_length(reducedStats); i++){
		factionChangeAmount = 10
		statChangeAmount = 15

		if string_count(reducedStats[i], "small") == 1{
			factionChangeAmount = 5
			statChangeAmount = 7
			reducedStats[i] = string_delete(reducedStats[i], 1, 5)
		} else if string_count(reducedStats[i], "big") == 1{
			factionChangeAmount = 20
			statChangeAmount = 30
			reducedStats[i] = string_delete(reducedStats[i], 1, 3)
		}

		if reducedStats[i] != "rep"{
			reduceStat(reducedStats[i], statChangeAmount)
		} else {
			reduceFaction(faction, factionChangeAmount)
		}
	}
}