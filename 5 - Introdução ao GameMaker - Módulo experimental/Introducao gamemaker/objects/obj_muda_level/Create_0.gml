/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
colidi_player = false;

metodo_colisao_player = function()
{
	if (colidi_player == false)
	{
	    cria_transicao_inicia(destino);
	    //Aviso que eu já colidi com o player
	    //Assim eu não vou repetir a mensagem
	    colidi_player = true;
    
	}	
}