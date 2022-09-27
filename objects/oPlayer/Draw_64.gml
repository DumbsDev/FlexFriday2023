#region Exiting
draw_set_font(fnt_large);
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_color(c_black)
draw_set_alpha(leaving*0.3)
draw_rectangle(0,0,320,70,0)
draw_set_color(c_white)
draw_set_alpha(1)
draw_text_color(0,0,"EXITING...",c_white,c_white,c_white,c_white,leaving);
draw_set_alpha(leaving);
draw_rectangle_color(4,32,256,64,c_grey,c_grey,c_grey,c_grey,0)
draw_rectangle_color(4,32,128*leaving,64,c_orange,c_orange,c_orange,c_orange,0)
#endregion
#region Savedata
draw_set_valign(fa_bottom);
draw_set_halign(fa_left)
draw_set_alpha(0.3);
draw_rectangle_color(0,k*2,208,(k*2)-64,c_black,c_black,c_black,c_black,0)
draw_set_alpha(1);
ini_open("savedata.ini");
draw_text(0,k*2 - 16,"Day: " + string(ini_read_real("savedata", "day", 0)));
ini_close();
draw_set_halign(fa_right)
draw_set_font(fnt_small)
draw_set_alpha(0.2)
draw_rectangle_color(j,0,j-356,256,c_black,c_black,c_black,c_black,0)

draw_set_alpha(1);
ini_open("savedata.ini");
draw_text(j,24,"Rations:" + string(ini_read_real("savedata", "food", 0)));
draw_text(j,48,"Water Bottles:" + string(ini_read_real("savedata", "water", 0)));
draw_text(j,72,"Huts:" + string(ini_read_real("savedata", "houses", 0)));
draw_text(j,96,"People:" + string(ini_read_real("savedata", "population", 0)));
ini_close();
#endregion
#region Debugging
var _DebugToggle = keyboard_check_pressed(vk_f3);

if _DebugToggle {
switch (debug) {
	case 1:
	debug = 0;
	break;
	
	case 0:
	debug = 1;
	break;
}
}

if debug = 1 {
draw_set_color(c_black)
draw_set_alpha(0.5)
draw_rectangle(0,0,360,480,0)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_text(0,0,string(fpslow) + " fps")
draw_text(0,24,string(round(fps_real)) + " fastfps")
draw_text(0,48,string(fps) + " real fps")
draw_text(0,72,string(instance_count) + " instances")
draw_text(0,96,"room: " + string(room_get_name(room)));
draw_text(0,120,"seed: " + string(gameSeed));
ini_open("savedata.ini")
draw_text(0,144,"save: " + string(ini_section_exists("savedata")));
ini_close();
}

#endregion