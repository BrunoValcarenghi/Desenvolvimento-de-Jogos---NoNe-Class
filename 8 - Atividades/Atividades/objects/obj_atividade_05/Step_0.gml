x += vel_x; //movimenta eixo x
y += vel_y; //movimenta eixo y (como é 0, nao altera)

if (x > room_width - 32 or x < 32) //se chegou na borda da sala
{
	vel_x = -vel_x; //inverte a vel
}