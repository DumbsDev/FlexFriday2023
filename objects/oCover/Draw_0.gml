alpha += 0.025
draw_set_color(c_black);
draw_set_alpha(alpha)
draw_rectangle(0,0,room_width,room_height,0)

switch button {
//do nothing if not selected
	case 0:
	break;
	
//If the screen is black, close the game (and exit pressed)
	case 1:
	if alpha >= 1 {
	game_end();	
	}
	break;
//Go to the main game
	case 2:
	if alpha >= 1 {
	room_goto(rm_main);
	}
	break;
}