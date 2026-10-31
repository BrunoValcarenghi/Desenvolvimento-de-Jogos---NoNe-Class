//movimenta obj
x += vel_x; 
y += vel_y;

if (y > room_height - 32 or y < 32)//checa se tocou na borda vertical da room
{
	vel_y  = -vel_y; //inverte a velocidade vertical
	if (vel_y > 0)
	{
		vel_y += 1; //aumenta velocidade
	}
	else
	{
		vel_y -= 1; //aumenta velocidade se estiver no sentido contrario
	}
}
else if (x > room_width - 32 or x < 32) //checa se tocou na borda horizontal da room
{
	vel_x = -vel_x; //inverte a velocidade horizontal
	if (vel_x > 0)
	{
		vel_x += 1; //aumenta velocidade
	}
	else
	{
		vel_x -= 1;  //aumenta velocidade se estiver no sentido contrario
	}
}


//define limite pra velocidade de 20
if (vel_x > 20)
{
	vel_x = 20;
}
else if (vel_x < -20)
{
	vel_x = -20;
}
if (vel_y > 20)
{
	vel_y = 20;
}
else if (vel_y < -20)
{
	vel_y = -20;
}