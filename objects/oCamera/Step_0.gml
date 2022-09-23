if oPlayer.x > 1056 {
	x = lerp(x,Perp1,la)
} else if oPlayer.x < 1056 && oPlayer.x > 512{
	x = lerp(x,Perp2,la)
} else {
	x = lerp(x,Perp3,la)
}