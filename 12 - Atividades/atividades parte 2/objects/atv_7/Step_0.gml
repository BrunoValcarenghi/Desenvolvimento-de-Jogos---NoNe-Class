//movimenta obj
x += vel_x;
y += vel_y;

//checa se saiu da room horizontalmente
if (x > room_width + 32)
{	
	
	//traz pro centro da room
	x = room_width / 2;
	y = room_height / 2;
	//zera velocidade
	vel_x = 0;
	
	alarm[0] = room_speed * 2; //reseta alarm0
}

//mesmo esquema porem vertical e chama alarm1
if (y > room_height + 32)
{
	x = room_width / 2;
	y = room_height / 2;
	vel_y = 0;
	
	alarm[1] = room_speed * 2;
}

