/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



//Saiba se ele precisa seguir o alvo dele (o player)
segue_player = false;
alvo = noone;

numero = 0;
abrindo_porta = false;
porta_alvo = noone;

metodo_colisao_player = function()
{
	
	//Se eu estou seguindo o player, eu não preciso rodar NADA desse evento
	if (segue_player) exit;

	//Me colocando no array de minhas chaves do player
	obj_player.minhas_chaves[obj_player.chaves] = id;

	//Aumentos as chaves do player
	//Se eu não estou seguindo o player eu faço isso
	obj_player.pega_chave(); //Aumenta o número de chaves do player
	segue_player = true;
	alvo = obj_player.id;

	//Vou falar qual meu número de chave
	numero = alvo.chaves;	
	
}