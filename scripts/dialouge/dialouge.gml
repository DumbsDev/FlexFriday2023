// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.dialouge = function(faction, impactMulti, improve, reduce){
	switch (improve){
		case "money":
			money += 5 * impactMulti;
			break;
		case "happy":
			happy += 5 * impactMulti;
			break;
		case "food":
			food += 5 * impactMulti;
			break;
		default:
			show_debug_message("Incorrect improve value");
			break;
	}
	switch (reduce){
		case "money":
			money -= 5 * impactMulti;
			break;
		case "happy":
			happy -= 5 * impactMulti;
			break;
		case "food":
			food -= 5 * impactMulti;
			break;
		default:
			show_debug_message("Incorrect reduce value");
			break;
	}
	//switch (faction){
		//case "fact1":
			//add smth
			//break;
		//cont.
	//}
}