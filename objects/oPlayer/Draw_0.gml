#region Define Key Input Variables
var _up = keyboard_check(ord("W")) or keyboard_check(vk_up),
_down = keyboard_check(ord("S")) or keyboard_check(vk_down),
_left = keyboard_check(ord("A")) or keyboard_check(vk_left),
_right = keyboard_check(ord("D")) or keyboard_check(vk_right),
#endregion
#region Movement
if _up or _down or _left or _right {
	draw_set_color(c_black)
	draw_set_alpha(0.35)
	draw_ellipse(x-16*xsc,y+4,x+8*xsc,y+12,0)
	draw_set_color(c_white)
	draw_set_alpha(1)
	sprite_index = sPlayer
	image_speed = 1;
} else {
	draw_set_color(c_black)
	draw_set_alpha(0.35)
	draw_ellipse(x-12,y+4,x+12,y+12,0)
	draw_set_color(c_white)
	draw_set_alpha(1)
	sprite_index = sPlayerStill
	image_speed = 0;
	image_index = 0;
}

draw_sprite_ext(sprite_index,image_index,x,y,xsc*1.5,1.5,0,c_white,1)
#endregion