#region movement
xx = x; //Set xx future pos 
yy = y; //Set yy future pos
la = 0.25 //Amount to lerp movement
moveSpeed = 2 //player speed
#endregion
#region debug and save data
leaving = 0 // Set close game variable to 0
ini_open("savedata.ini"); //Set the save data
global.day = ini_read_real("savedata", "day", 0); //set the current day
global.water = ini_read_real("savedata", "water", 15); //set the current day
global.food = ini_read_real("savedata", "food", 15); //set the current day
global.houses = ini_read_real("savedata", "houses", 10); //set the current day
global.population = ini_read_real("savedata", "population", 25); //set the current day
global.intel = ini_read_real("savedata", "intel", 0); //set the intelligence
global.joy = ini_read_real("savedata", "joy", 25); //set the intelligence
/// Fix the stuffs to old lol
oldWater = ini_read_real("savedata", "owater", 0); //set the current day
oldFood = ini_read_real("savedata", "ofood", 0); //set the current day
oldHouses = ini_read_real("savedata", "ohouses", 0); //set the current day
oldPopulation = ini_read_real("savedata", "opopulation", 0); //set the current day
oldIntel = ini_read_real("savedata", "ointel", 0); //set the intelligence
oldJoy = ini_read_real("savedata", "ojoy", 0); //set the joy
ini_close(); //close the ini file to prevent a memory leak
k = camera_get_view_border_y(view_camera[0])
j = camera_get_view_border_x(view_camera[0])

randomize();
text_id = ""
#endregion
#region appearance
hair = 0
shirt = 0
eyes = 0
lips = 0
pants = 0
shoes = 0
accesory = 0
xsc = 1
#endregion appearance
#region sleep and data stuff like that
sleep = false
#endregion
//Factions and stuff
#region HARD HAT ZONE
	global.waterCult = 0
	global.resistance = 0
	global.roundEarthers = 0

	global.waterMulti = 0
	global.foodMulti = 0
	global.joyMulti = 0

	//waterCultMax = false
	//resistanceMax = false
	//roundEarthersMax = false
#endregion