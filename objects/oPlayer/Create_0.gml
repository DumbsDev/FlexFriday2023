random_set_seed(gameSeed)

xx = x; //Set xx future pos 
yy = y; //Set yy future pos
la = 0.25 //Amount to lerp movement
moveSpeed = 2 //player speed
leaving = 0 //set close game variable to 0
ini_open("savedata.ini"); //Set the save data
day = ini_read_real("savedata", "day", 0); //set the current day
water = ini_read_real("savedata", "water", 0); //set the current day
food = ini_read_real("savedata", "food", 0); //set the current day
houses = ini_read_real("savedata", "houses", 0); //set the current day
population = ini_read_real("savedata", "population", 0); //set the current day
ini_close(); //set the save data
j = camera_get_view_width(view_camera[0])*2 + 328
k = room_height + 64
debug = 0
fpslow = 0
alarm[0] = 1