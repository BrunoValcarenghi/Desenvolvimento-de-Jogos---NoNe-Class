vel_x = 2;
vel_y = 0;

/*
	define as velocidades iniciais
	quando sai da tela, volta para o centro da room
		se for pela lateral ele tira velocidade horizontal e chama alarm 0
		se for pela vertical tira velocidade vertical e chama alrm 1
		
	alarm 0 adiciona velocidade vertical
	alarm 1 horizontal
	
	o tempo entre a votla pra o centro e o disparo do alarm
	mantem o obj no centro por um tempo
	
*/