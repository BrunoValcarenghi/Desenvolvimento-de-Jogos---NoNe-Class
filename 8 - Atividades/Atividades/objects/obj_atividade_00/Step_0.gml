x = x + 2; // acrescenta 2 no valor do X a cada frame, q faz o objeto "andar" para direita

if (x > room_width) // checa se x é maior que a largura da room
{
	x = 0; //se sim, volta o objeto para a posicao 0, inicio da room
}