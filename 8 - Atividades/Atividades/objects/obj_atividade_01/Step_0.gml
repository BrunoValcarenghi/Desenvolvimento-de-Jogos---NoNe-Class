x = x + vel; //acrescenta em X o valor de Vel, 
			 //ou seja movimenta o X conforme a variavel Vel

if (x > room_width + 32) //checa se o valor do x esta maior q a largura da room + 32,
						 //ou seja,saiu completamente da sala
{
	x = -32;		//posiciona 32 pixel antes da room, para que ele apareca aos poucos
	vel = vel + 1;	//aumenta a velocidade a cada "ciclo"
}