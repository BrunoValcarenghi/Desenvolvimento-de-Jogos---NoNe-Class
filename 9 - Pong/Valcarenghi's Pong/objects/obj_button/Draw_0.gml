if ia = 0{

	image_index = 2
	txt = "Multiplayer"
	
}
else if ia = 1{

	image_index = 1
	txt = "Singleplayer"
	
}

draw_self()

draw_set_font(f_font)
draw_set_halign(1)
draw_set_colour(#19332D)
draw_text(x, y+20, txt)