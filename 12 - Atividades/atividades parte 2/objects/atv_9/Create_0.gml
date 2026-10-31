vel_x = 10; //inicia com uma velocidade de 10

tempo = 1; //começa com um tempo de 1

alarm[0] = room_speed * tempo; //alarm0 vai iniciar sendo uma relação tempo*frames da sala(por padrao 60)

/*
	
	um efeito de acelerar o obj e frear
	
	adiciona uma velocidade
	a cada frame diminui a velocidade
	
	a velocidade é aumentada quando o alamr 0 é disparado
	
	a cada disparo do alarm ele demora mais para o proximo

*/