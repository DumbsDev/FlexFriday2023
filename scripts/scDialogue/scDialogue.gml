function dialogueGenerator(improvedStat, reducedStat, randomizeInput=false){
	var dialogue = ""
	
	if randomizeInput{
		impRand = choose(0, 1, 2, 3)
		print(string(impRand))
		switch impRand{
			case 0:
				improvedStat = "food"
				break
			case 1:
				improvedStat = "money"
				break
			case 2:
				improvedStat = "happiness"
				break
			case 3:
				improvedStat = "water"
				break
			default:
				print("BIG DEFAULT ON LINE 19 OF scDIALOGUE")
		}
		correctReducedStat = false
		while not correctReducedStat{
			reducedRand = choose(0, 1, 2, 3)
			switch reducedRand{
				case 0:
					reducedStat = "food"
					break
				case 1:
					reducedStat = "money"
					break
				case 2:
					reducedStat = "happiness"
					break
				case 3:
					reducedStat = "water"
					break
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
			break
		case "money":
			dialogue += "Would you like to increase our kingdom's wealth by "
			break
		case "happiness":
			dialogue += "Would you like to increase our kingdom's happiness by "
			break
		case "water":
			dialogue += "Would you like to improve our kingdom's water supply by "
			break
		default:
			show_debug_message("Incorrect improvedStat value in dialogueGenerator function")
			break
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
			break

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
			break

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
			break
		
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
			break
			
		default:
			show_debug_message("Invalid reducedStat parameter")
			break
	}
magnitude = 15
returnArray = [dialogue, improvedStat, reducedStat, magnitude]
return returnArray
}

function pickRandomFaction(){
	randomNum = choose(0)
	switch randomNum{
		case 0:
			faction = "water cult"
			break
		case 1:
			faction = "farmers union"
			break
		case 2:
			faction = "bandits"
			break
		case 3:
			faction = "emperors court"
			break
		default:
			show_debug_message("Invalid randomNum value in pickRandomFactionDialogue function")
			break
	}	
	return faction
}

function pickRandomFactionDialogue(faction){
	//create variables
	dialogue = ""
	randomNum = choose(0, 1, 2, 3)

	switch faction{
		

		case "water cult":
			switch randomNum{
				case 0:
					//set dialogue
					dialogue = "I am a representative of the water cult. We would like to sacrifice cows to the water god. We want to do it in the town square." 
					break
				case 1:
					dialogue = "I am a representative of the water cult. We want more water to do rituals."
					break
				case 2:
					dialogue = "I am from the water cult. We want to hold a celebration in the kingdom and would like your sponsorship."
					break
				case 3:
					dialogue = "I am from the water cult. We want to build another temple in the kingdom."
					break
				default:
					show_debug_message("Invalid randomNum value in pickRandomFactionDialogue function")
					break
			}
			break
		
/*
		case "farmers union":
			switch randomNum{
				case 0:
					dialogue = "I am a representative of the farmers union. We want to build a new barn."
					break
				case 1:
					dialogue = "I am a representative of the farmers union. We want to build a new well."
					break
				case 2:
					dialogue = "I am a representative of the farmers union. We want to build a new irrigation system."
					break
				case 3:
					dialogue = "I am a representative of the farmers union. We want to build a new mill."
					break
			}
			break

		
		case "bandits":
			dialogue = "We are the bandits. We will give you money in exchange for your food."
			break

		
		case "emperors court":
			dialogue = "We are the emperors court. We will give you happiness in exchange for your money."
			break

*/		
		default:
			show_debug_message("Invalid faction parameter in pickRandomFactionDialogue function")
			break
	}
	return [faction, dialogue]
}

function factionDialogueResponses(faction, dialogue){
	//create variables
	responses = []

	switch faction{
		case "water cult":

			switch dialogue{
				case "I am a representative of the water cult. We would like to sacrifice cows to the water god. We want to do it in the town square.":
					responses = ["I will allow it.", "I will not allow it to happen in the town square.", "I will not allow it to happen."]
					break
				
				case "I am a representative of the water cult. We want more water to do rituals.":
					responses = ["I will give you water from our reserves for crops", "I will give you water out of our general supply.", "We cannot give you any water."]
					break

				case "I am from the water cult. We want to hold a celebration in the kingdom and would like your sponsorship.":
					responses = ["I will allow it and pay for it.", "I will allow it but I refuse to pay for it", "I will not allow it."]
					break

				case "I am from the water cult. We want to build another temple in the kingdom.":
					responses = ["I will give you gold from our treasury.", "I will tax the people and give you gold from that.", "We cannot give you any gold."]
					break

				default:
					show_debug_message("Invalid dialogue parameter in factionDialogueResponse function")
					break
			}
			break
		
		default:
			show_debug_message("Invalid faction parameter in factionDialogueResponse function")
			break
	}
	return responses
}

function interpretPlayerResponse(faction, dialogue, response){
	//create variables
	improvedStats = []
	reducedStats = []

	switch faction{

		case "water cult":

			switch dialogue{

				case "I am a representative of the water cult. We would like to sacrifice cows to the water god. We want to do it in the town square.":

					switch response{

						case "I will allow it.":
							improvedStats = ["big rep"]
							reducedStats = ["happiness", "small food"]
							break

						case "I will not allow it to happen in the town square.":
							improvedStats = ["small rep"]
							reducedStats = ["small food"]
							break

						case "I will not allow it to happen.":
							improvedStats = []
							reducedStats = ["small rep"]
							break

						default:
							show_debug_message("Invalid response parameter in interpretPlayerResponse function")
							break
					}
					break
				
				case "I am a representative of the water cult. We want more water to do rituals.":

					switch	response{

						case "I will give you water from our reserves for crops":
							improvedStats = ["rep"]
							reducedStats = ["food"]
							break
						
						case "I will give you water out of our general supply.":
							improvedStats = ["rep"]
							reducedStats = ["water"]
							break
						
						case "We cannot give you any water.":
							improvedStats = []
							reducedStats = ["rep"]
							break
					}

				case "I am from the water cult. We want to hold a celebration in the kingdom and would like your sponsorship.":
					switch response{

						case "I will allow it and pay for it.":
							improvedStats = ["rep", "happiness"]
							reducedStats = ["big gold"]
							break

						case "I will allow it but I refuse to pay for it":
							improvedStats = ["happiness"]
							reducedStats = ["rep"]
							break

						case "I will not allow it.":
							improvedStats = []
							reducedStats = ["small rep"]
							break

						default:
							show_debug_message("Invalid response parameter in interpretPlayerResponse function")
							break
					}
					break

				case "I am from the water cult. We want to build another temple in the kingdom.":
					switch response{

						case "I will give you gold from our treasury.":
							improvedStats = ["rep"]
							reducedStats = ["gold"]
							break

						case "I will tax the people and give you gold from that.":
							improvedStats = ["rep"]
							reducedStats = ["happiness"]
							break

						case "We cannot give you any gold.":
							improvedStats = []
							reducedStats = ["small rep"]
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
	
		default:
			show_debug_message("Invalid faction parameter in interpretPlayerResponse function")
			break
	}
	return [improvedStats, reducedStats]
}

function updateFactionStats(faction, improvedStats, reducedStats){
	//create variables
	factionChangeAmount = .05
	statChangeAmount = 15

	//update stats
	for (var i = 0; i < improvedStats.length; i++){
		factionChangeAmount = .05
		statChangeAmount = 15

		if string_count(improvedStats[i], "small") == 1{
			factionChangeAmount = .02
			statChangeAmount = 7
			improvedStats[i] = string_delete(improvedStats[i], 1, 5)
		} else if string_count(improvedStats[i], "big") == 1{
			factionChangeAmount = .1
			statChangeAmount = 30
			improvedStats[i] = string_delete(improvedStats[i], 1, 3)
		}

		if improvedStats[i] != "rep"{
			improveStat(improvedStats[i], statChangeAmount)
		} else {
			improveFaction(faction, factionChangeAmount)
		}
	}

	for (var i = 0; i < reducedStats.length; i++){
		factionChangeAmount = .05
		statChangeAmount = 15

		if string_count(reducedStats[i], "small") == 1{
			factionChangeAmount = .02
			statChangeAmount = 7
			reducedStats[i] = string_delete(reducedStats[i], 1, 5)
		} else if string_count(reducedStats[i], "big") == 1{
			factionChangeAmount = .1
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