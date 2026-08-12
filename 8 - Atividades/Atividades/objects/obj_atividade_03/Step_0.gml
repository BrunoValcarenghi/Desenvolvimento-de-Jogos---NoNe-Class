x += vel; // adiciona vel em x

if (x > room_width + 32) // chega se saiu da sala pela esquerda
{
	x = -32; //se saiu, volta pra borda esquerda
	vel = vel * 2; //duplica a vel
}

if (vel > 32) // se a vel for muito alta (32) 
{
	vel = 2; // volta para 2
}