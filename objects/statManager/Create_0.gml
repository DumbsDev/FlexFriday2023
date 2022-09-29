/// @description Insert description here
// You can write your code in this editor
global.FMH = [100,100,100] // FMH = [food, money, happiness]
global.factions = {
	nobility: 0,
	military: 0,
	common: 0
}

dialogueChange = function(improve, reduce, impactMulti=1){
	switch (improve){
        case "food":
            global.FMH[0] += 5 * impactMulti;
            break;
        case "money":
            global.FMH[1] += 5 * impactMulti;
            break;
        case "happiness":
            global.FMH[2] += 5 * impactMulti;
            break;
        default:
            show_debug_message("Incorrect improve value");
            break;
    }
    switch (reduce){
        case "food":
            global.FMH[0] -= 5 * impactMulti;
            break;
        case "money":
            global.FMH[1] -= 5 * impactMulti;
            break;
        case "happiness":
            global.FMH[2] -= 5 * impactMulti;
            break;
        default:
            show_debug_message("Incorrect reduce value");
            break;
    }
	
	// faction rep changes must be done seperatly
}

