if room != rm_main {
x = room_width/2
y = room_height/2
} else {

if oPlayer.x > 1020 {
	x = lerp(x,Perp1,la)
} else if oPlayer.x < 1020 && oPlayer.x > 512{
	x = lerp(x,Perp2,la)
} else {
	x = lerp(x,Perp3,la)
}

switch keyboard_key {

	case vk_add:
		camera_set_view_size(view_camera[0],camw,camh)
		break;
	
	case vk_subtract:
		camera_set_view_size(view_camera[0],camw/4,camh/4)
		break;
	}
}