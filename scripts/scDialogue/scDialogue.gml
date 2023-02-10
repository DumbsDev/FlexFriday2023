function dialogueGenerator(improvedStat="", reducedStat="", randomizeInput=false){
	var dialogue = ""
	
	if randomizeInput{
		impRand = irandom_range(0, 2)
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
			default:
				print("BIG DEFAULT ON LINE 16 OF scDIALOGUE")
		}
		correctReducedStat = false
		while not correctReducedStat{
			reducedRand = irandom_range(0, 2)
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
		default:
			show_debug_message("Incorrect improvedStat value in dialogueGenerator function")
			break
	}
	
	switch (reducedStat){
		case "food":
			if (improvedStat == "money"){
				randomNum = irandom_range(0, 1)
				if randomNum == 0{
					dialogue += "selling our crops to a neighboring kingdom?"
				} else {
					dialogue += "increasing taxes on crops?"
				}
			} else {
				if randomNum == 1{
					dialogue += "increasing rations?"
				} else {
					dialogue += "hold a feast for the commonwealth?"
				}
			}
			break
		case "money":
			if (improvedStat == "food"){
				randomNum = irandom_range(0, 1)
				if randomNum == 0{
					dialogue += "purchasing food from our neighboring kingdom?"
				} else {
					dialogue += "reducing taxes on crops?"
				}
			} else {
				if randomNum == 1{
					dialogue += "advertising for a carnival to come to the kingdom?"
				} else {
					dialogue += "build a theater in the town square?"
				}
			}
			break
		case "happiness":
			if (improvedStat == "food"){
				randomNum = irandom_range(0, 1)
				if randomNum == 0{
					dialogue += "reducing rations?"
				} else {
					dialogue += "demanding more food from farmers?"
				}
			} else {
				if randomNum == 1{
					dialogue += "invading a nearby kingdom for it's resources?"
				} else {
					dialogue += "stoping maintaining public works?"
				}
			}
			break
		default:
			show_debug_message("Invalid reducedStat parameter")
			break
	}
print(dialogue)
sText(dialogue)
}

/*
changeFactions = function(increaseFaction, reduceFaction){
	switch increaseFaction{
		case "water cult"
	}
}
*/