factionLogic()
dailyPopChange()

ini_open("savedata.ini")
day = ini_read_real("savedata", "day", 0); //set the current day
water = ini_read_real("savedata", "water", 0); //set the current day
food = ini_read_real("savedata", "food", 0); //set the current day
houses = ini_read_real("savedata", "houses", 0); //set the current day
population = ini_read_real("savedata", "population", 0); //set the current day
intel = ini_read_real("savedata", "intel", 0); //set the intelligence
joy = ini_read_real("savedata", "joy", 0); //set the intelligence
//old stuff
/// Fix the stuffs to old lol
oldWater = ini_read_real("savedata", "pwater", 0); //set the current day
oldFood = ini_read_real("savedata", "ofood", 0); //set the current day
oldHouses = ini_read_real("savedata", "ohouses", 0); //set the current day
oldPopulation = ini_read_real("savedata", "opopulation", 0); //set the current day
oldIntel = ini_read_real("savedata", "ointel", 0); //set the intelligence
oldJoy = ini_read_real("savedata", "ojoy", 0); //set the joy
ini_close();
if water >= oldWater {
	change = "+ "
} else {
	change = "- "	
}
string1 = "Water: " + string(water) + " (" + string(oldWater) + change + string(water-oldWater) + ")\n"
if food >= oldFood {
	change = "+ "
} else {
	change = "- "	
}
string2 = "Food: " + string(food) + " (" + string(oldFood) + change + string(food-oldFood) + ")\n"

if houses >= oldHouses {
	change = "+ "
} else {
	change = "- "	
}
string3 = "Housing Space: " + string(houses) + " (" + string(oldHouses) + change + string(houses-oldHouses) + ")\n"

if population >= oldPopulation {
	change = "+ "
} else {
	change = "- "	
}
string4 = "Population: " + string(population) + " (" + string(oldPopulation) + change + string(population-oldPopulation) + ")\n"
