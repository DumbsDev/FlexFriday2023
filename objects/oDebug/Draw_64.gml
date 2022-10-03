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
//draw_text(0,120,"seed: " + string(gameSeed));
ini_open("savedata.ini")
draw_text(0,144,"save: " + string(ini_section_exists("savedata")));
ini_close();
}
