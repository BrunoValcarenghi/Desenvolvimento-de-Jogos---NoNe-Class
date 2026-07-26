/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Se eu tenho que seguir o player
//Eu vou fazer o meu X ser igual ao X do meu algo (eu preciso ter alvo)
//E vou fazer meu Y ser parecido com o do player (fique mais ou menos na altura da cabeça)

if (abrindo_porta)
{
    //Meu código de ir até a porta e abrir ela
    //Existe a minha porta alvo?
    if (instance_exists(porta_alvo))
    {
        //Indo até a minha porta alvo
        x = lerp(x, porta_alvo.x, .1);
        y = lerp(y, porta_alvo.y - porta_alvo.sprite_height / 2, .1);
    }
    
    
    //Se a minha distância do X da porta for menor do que 2, eu abro a porta e me destruo
    var _dist_x = abs(x - porta_alvo.x);
    if (_dist_x < 1)
    {
        //Avisando que a porta alvo tem que abrir
        porta_alvo.estado = "abrindo";
        //Me destruindo
        instance_destroy();
        
        //Dando uma tremida legal na tela
        screenshake(20);
    }
    
    //Vou sair do evento porque não preciso seguir o player mais
    exit;
}




if (segue_player)
{
    //Checando se meu alvo existe
    if (instance_exists(alvo))
    {
        var _dist_x = abs(x - alvo.x);
        
        var _margem_x = (15 * numero) * -alvo.dir;
        
        //Seguindo o X do alvo se a distância x dele for maior do que 15
        if (_dist_x != (_margem_x))
        {
            x = lerp(x, alvo.x + (_margem_x), .05);
        }
        
        //Ficando mais ou menos na altura da cabeça do alvo
        //Sinwave 
        var _sinwave = 5 * sin((5 + numero * 0.1) * current_time / 1000);
        
        y = lerp(y,alvo.y - alvo.sprite_height / 1.5 + _sinwave, .1);
    }
}



