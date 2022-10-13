draw_set_halign(fa_left);
draw_set_valign(fa_top);
disx = (display_get_gui_width()/2)
disy = (display_get_gui_height()/2)

x = disx
y = disy

draw_set_color(c_white);
draw_rectangle(x-disx+(disx/4),y-disy+(disy/4),x+disx-(disx/4),y+disy-(disy/4),0)
draw_set_color(c_white)
//draw_text(x-disx+(disx/4),)