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


function improveStat(stat, magnitude){
	switch stat{
		case "food":
			global.food += magnitude
			break
		
		case "water":
			global.water += magnitude
			break
		
		case "money":
			global.gold += magnitude
			break

		case "happiness":
			global.joy += magnitude
			break
	}
}


function reduceStat(stat, magnitude){
	switch stat{
		case "food":
			global.food -= magnitude
			break
		
		case "water":
			global.water -= magnitude
			break
		
		case "money":
			global.gold -= magnitude
			break
		
		case "happiness":
			global.joy -= magnitude
			break
	}
}

/*
changeFactions = function(increaseFaction, reduceFaction){
	switch increaseFaction{
		case "water cult"
	}
}
*/