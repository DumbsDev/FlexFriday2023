draw_set_halign(fa_left);
draw_set_valign(fa_top);
disx = (display_get_gui_width()/2)
disy = (display_get_gui_height()/2)

x = disx
y = disy

draw_set_color(c_black);
draw_rectangle(x-disx+(disx/4),y-disy+(disy/4),x+disx-(disx/4),y+disy-(disy/4),0)
draw_set_color(c_white)
draw_set_halign(fa_center);
draw_set_valign(fa_top)
draw_text(x-disx+(disx),y-disy+(disy/4)+24,
//draw the saved variables as a string
"WATER:" + string(oPlayer.water) + "\n" +
"FOOD:" + string(oPlayer.food))