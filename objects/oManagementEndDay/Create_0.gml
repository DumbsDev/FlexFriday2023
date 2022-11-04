ini_open("savedata.ini")
day = ini_read_real("savedata", "day", 0); //set the current day
water = ini_read_real("savedata", "water", 0); //set the current day
food = ini_read_real("savedata", "food", 0); //set the current day
houses = ini_read_real("savedata", "houses", 0); //set the current day
population = ini_read_real("savedata", "population", 0); //set the current day
intel = ini_read_real("savedata", "intel", 0); //set the intelligence
joy = ini_read_real("savedata", "joy", 0); //set the intelligence
ini_close();
if food >= 0 {
	change = "+ "
} else {
	change = "- "	
}
string_ = "Food: " + change + string(food-oPlayer.oldFood) + " " + string(food)