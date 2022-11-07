/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_sprite_part(sprite_index, 1, 0, 0, sprite_width*value_, sprite_height, x, y-sprite_get_yoffset(sprite_index))
draw_sprite(BAR_DOT, 0, x+sprite_width*value_, y)