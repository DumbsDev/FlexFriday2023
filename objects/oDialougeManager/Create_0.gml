/// @description The Dialogue Creator 
// You can write your code in this editor


#region set global vars
numPrompts = 0; 
stats = {
	food: 100,
	money: 100,
	happiness: 100
};


factions = {
	nobility: 0,
	military: 0,
	common: 0
};
#endregion

dialogueGenerator = function(improvedStat, reducedStat){
	var dialogue = ""
	
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
				if (random(2) >= 1){
					dialogue += "selling our crops to a neighboring kingdom?"
				} else {
					dialogue += "increasing taxes on crops?"
				}
			} else {
				if (random(2) >= 1){
					dialogue += "increasing rations?"
				} else {
					dialogue += "hold a feast for the commonwealth?"
				}
			}
			break
		case "money":
			if (improvedStat == "food"){
				if (random(2) >= 1){
					dialogue += "purchasing food from our neighboring kingdom?"
				} else {
					dialogue += "reducing taxes on crops?"
				}
			} else {
				if (random(2) >= 1){
					dialogue += "advertising for a carnival to come to the kingdom?"
				} else {
					dialogue += "build a theater in the town square?"
				}
			}
			break
		case "happiness":
			if (improvedStat == "food"){
				if (random(2) >= 1){
					dialogue += "reducing rations?"
				} else {
					dialogue += "demanding more food from farmers?"
				}
			} else {
				if (random(2) >= 1){
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
	return dialogue
}

