if place_meeting(x, y, obj_raquete){
	
	direction = (irandom_range(160, 180) - direction) % 360
	if speed < 5 speed *= 1.1

}
if place_meeting(x, y, obj_colisao){

	direction = (360 - direction) % 360

}

if x < 0 - 16 or x > room_width + 16{	
	
	if x < 0 {
		global.player_1_pontos++
		dir = 0
	}
	else{
		global.player_2_pontos++
		dir = 1
	}

	if global.player_1_pontos < 2 and global.player_2_pontos < 2{
		
		bola = instance_create_layer(room_width/2, room_height/2, "Instances", obj_ball)
		bola.dir = dir
		bola.definir_direcao()
		
	}
	else{
	
		instance_create_layer(room_width/2, room_height/2, "Instances", obj_win)
	
	}

	instance_destroy()
	
}