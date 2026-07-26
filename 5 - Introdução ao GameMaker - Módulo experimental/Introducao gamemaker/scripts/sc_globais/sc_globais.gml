// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações



//Definindo se o power up da tinta esta desbloqueado
global.tinta	= false;
global.correr   = false;
global.pulo     = false;


//Posição inicial do player
global.player_x = 48;
global.player_y = 544;
global.room_atual = room_modelo;

global.save_atual = 1;

//Função para salvar o jogo
function salvar_jogo()
{
    //Criando a struct com os meus dados
    var _struct_power_ups = 
    {
        power_up_tinta : global.power_up_tinta,
        power_up_run   : global.power_up_run
    };
    
    var _struct_info_player = 
    {
        player_x : global.player_x,
        player_y : global.player_y,
        room_atual : global.room_atual
    }
    
    var _struct = 
    {
        power_ups : _struct_power_ups,
        inf_player: _struct_info_player
    };
    
    //Convertendo as informações da minha struct em um texto
   var _string = json_stringify(_struct);
   
   
   
   //Criando o meu buffer (de testes)
   var _buff = buffer_create(0, buffer_grow, 1);
   
   //Colocando o texto DENTRO do buffer
   buffer_write(_buff, buffer_string, _string);
   
   //Salvando no arquivo
   buffer_save(_buff, string("saveteste{0}.json", global.save_atual));
   
   
   //Deletando o buffer depois de ter usado ele
   buffer_delete(_buff);
}






//Criar uma função que faz isso tudo
function carrega_jogo()
{
    //Carregando as informações do jogo

    //Carregar o arquivo que eu salvei
    var _arquivo = string("saveteste{0}.json", global.save_atual);
    var _buff = buffer_load(_arquivo);
    
    
    
    //Se eu consegui carregar o arquivo
    //Se o buff for -1 eu cancelo tudo
    if (_buff == -1) 
    {
        return;
    }
    
    
    //Converter o arquivo para texto
    var _string = buffer_read(_buff, buffer_string);
    
    
    
    //Converter o texto do arquivo para uma struct
    //Converter meu texto (json) para uma struct
    var _struct = json_parse(_string);
    
    
    //Passar as informações da struct para as variáveis globais
    var _struct_power_up = _struct.power_ups;
    var _struct_inf_player = _struct.inf_player;
    
    global.player_x = _struct_inf_player.player_x;
    global.player_y = _struct_inf_player.player_y;
    global.room_atual = _struct_inf_player.room_atual;
    
    global.power_up_run = _struct_power_up.power_up_run;
    global.power_up_tinta = _struct_power_up.power_up_tinta;
    
    
    //Removendo o buffer criado
    buffer_delete(_buff);
}
