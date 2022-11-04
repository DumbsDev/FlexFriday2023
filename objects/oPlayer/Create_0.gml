#region movement
xx = x; //Set xx future pos 
yy = y; //Set yy future pos
la = 0.25 //Amount to lerp movement
moveSpeed = 2 //player speed
#endregion
#region debug and save data
leaving = 0 // Set close game variable to 0
ini_open("savedata.ini"); //Set the save data
day = ini_read_real("savedata", "day", 0); //set the current day
water = ini_read_real("savedata", "water", 0); //set the current day
food = ini_read_real("savedata", "food", 0); //set the current day
houses = ini_read_real("savedata", "houses", 0); //set the current day
population = ini_read_real("savedata", "population", 0); //set the current day
intel = ini_read_real("savedata", "intel", 0); //set the intelligence
joy = ini_read_real("savedata", "joy", 0); //set the intelligence
/// Fix the stuffs to old lol
oldWater = ini_read_real("savedata", "water", 0); //set the current day
oldFood = ini_read_real("savedata", "food", 0); //set the current day
oldHouses = ini_read_real("savedata", "houses", 0); //set the current day
oldPopulation = ini_read_real("savedata", "population", 0); //set the current day
oldIntel = ini_read_real("savedata", "intel", 0); //set the intelligence
oldJoy = ini_read_real("savedata", "joy", 0); //set the joy
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