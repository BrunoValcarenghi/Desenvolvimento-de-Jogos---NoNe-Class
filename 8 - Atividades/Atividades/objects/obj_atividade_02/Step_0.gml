x += vel; //adiciona vel ao x

if (x > room_width - 32) //checa se o obj chegou ao fim da sala direita
{
	vel = -3; //muda a velocidade para o obj "voltar"/"andar pra tras"
			  //na primeira execução a vel era 2
}
if (x < 32)//se ele chegou na borda esquerda
{
	vel = 3; //inverte a vel
}