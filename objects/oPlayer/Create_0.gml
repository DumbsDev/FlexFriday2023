random_set_seed(randomize())
gameSeed = random_get_seed()
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
k = camera_get_view_border_y(view_camera[0])
j = camera_get_view_border_x(view_camera[0])*2
interactx = x;
interacty = y;