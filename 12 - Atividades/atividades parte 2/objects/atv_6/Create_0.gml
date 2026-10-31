vel_x = 2; //começa com velocidade horizontal
vel_y = 0; // mas sem velocidade vertical

alarm[0] = 60; //alarm0 = 1 segundo

/*

- o obj inicia a velocidade x em 2 e a y em 0 alem de um alarm em 60 frames

- no step, ele faz o obj se mover conforme a velocidade horizontal e vertical

- tambem no step tem a verificação se o obj saiuda tela, se sim ele volta pelo outro lado

- o alrm 0 quando disparado faz a troca das velocidades, zera a horizontal e "liga" a vertical
ou vice-versa

-dpois disso o alrm 0 é definido como a velocidade da sala (q por padrao é 60 frames)

*/