var _hover = point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom);
var _click = _hover && mouse_check_button_pressed(mb_left)

if _hover == 1 {
	image_xscale = lerp(image_xscale,start_scaleMax,la);
	image_yscale = lerp(image_xscale,start_scaleMax,la);
} else {
	image_xscale = lerp(image_xscale,start_scaleMin,la);
	image_yscale = lerp(image_xscale,start_scaleMin,la);	
}

if _click == 1 {
	image_xscale = lerp(image_xscale,start_scaleMin+0.1,la);
	image_yscale = lerp(image_xscale,start_scaleMin+0.1,la);
	instance_create_layer(room_width/2,room_height/2,"cover",oCover)
	oCover.button = _chooseid

}