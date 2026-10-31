vel_x += 10 + tempo; //acelara o obj, adicionando velocidade 
//que sera cada vez maior´por causa da variavel tempo

tempo += 1; // variavel tempo incrementada a cada disparada do alarm

alarm[0] = room_speed * tempo; //reseta o alarm mantendo a relação com a variavel tempo
//variavel a qual foi incrementada anteriormente