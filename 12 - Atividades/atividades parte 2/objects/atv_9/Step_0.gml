x += vel_x; //movimenta obj

vel_x -= 0.1; //desacelera a cada frame

if (x > room_width + 32)
{	
	// se sair da tela pela direita volta para a borda esquerda
	x = -32;
}

if (vel_x < 0) vel_x = 0; //mantem velocidade positiva, nunca deixa o obj mover para traz