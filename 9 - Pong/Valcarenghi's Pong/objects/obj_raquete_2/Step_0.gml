if !global.ia{

if keyboard_check(vk_up)   and y > 36  y -= spd
if keyboard_check(vk_down) and y < 198 y += spd

}

else{
	
	if instance_exists(obj_ball){
		if obj_ball.y < y and y > 36  y -= spd
		if obj_ball.y > y and y < 198 y += spd
	}

}