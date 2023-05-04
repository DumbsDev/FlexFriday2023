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
#region day
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
#endregion
