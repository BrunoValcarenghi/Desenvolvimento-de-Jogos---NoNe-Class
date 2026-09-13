if ia = 0{

	image_index = 2
	
}
else if ia = 1{

	image_index = 1
	
}

button_hover = function(){
	
	if place_meeting(x, y, obj_cursor) {
	
		if image_xscale < 1.5{
		image_xscale += .1
		image_yscale += .1
		}
	
	}
	else{
	
		image_xscale = 1
		image_yscale = 1
	
	}

}