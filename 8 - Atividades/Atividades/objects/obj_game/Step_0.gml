if keyboard_check_pressed(vk_right){
	
	if room = Room_10 room_goto(Room_00)
	else room_goto_next()
}

if keyboard_check_pressed(vk_left){
	
	if room = Room_00 room_goto(Room_10)
	else room_goto_previous()
}