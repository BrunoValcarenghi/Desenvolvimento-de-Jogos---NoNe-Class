/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Iniciando coisas?
inicia_efeito_squash();
inicia_efeito_brilho(c_blue);

#region Variaveis

hub_player = false;

//Variáveis de movimento
velh         = 0;
max_velh     = velocidade_x;
velv         = 0;
max_velv     = velocidade_y;
grav         = gravidade;

velh_run     = velocidade_correr;
velh_walk    = velocidade_x;

qtd_pulos = 2;
qtd_pulos_atual = qtd_pulos;


toca_som_pulo = false;

//Variáveis do corner correction
corner_pixels = 8;

//Variáveis do coyote jump
coyote_timer = tempo_coyote;
coyoto_timer_atual = coyote_timer;


//Variáveis do buffer do pulo
pulo_timer = buffer_pulo;
pulo_timer_atual = 0;

//Lista de sprites por estado
lista_sprites = [spr_player_parando, spr_player_idle];
indice_sprite = 0;

//Variaveis do level?
chao = false;
chao_tinta = false;

tile_set_tinta = layer_tilemap_get_id("tl_tinta");

//Variáveis de inputs
right = false;
left  = false;
jump  = false;
paint = false;


//Contador de chaves
chaves = 0;
//Salvando as informações das minhas chaves
minhas_chaves = [];
timer_porta = game_get_speed(gamespeed_fps) * 6;
tempo_porta = 0;


//Variáveis de power ups
power_tinta = false;
power_pulo_duplo = false;
power_kamehameha = false;

//Variável com a minha lista de colisões
//Pegando a minha layer
var _layer = layer_tilemap_get_id("tl_level");
colisoes = [obj_parede, _layer];

//Direção que eu estou olhando
dir = 1;

//Variaveis dos estados
estado = noone;




#endregion

#region Métodos



//Criar um método que vai checar se o player precisa mudar a posição
//inicial dele
//Criar variáveis globais que vão definir a posição inicial do player
//Rodar esse método no create dele.

inicia_player = function()
{
    //Só vou iniciar a posição se eu sou hub
    //Se eu não sou hub, eu encerro o método aqui
    if (!hub_player) return;
        
    x = global.player_x;
    y = global.player_y;
}



//Método para pegar inputs
pega_input = function()
{
    right   = keyboard_check(ord("D"));
    left    = keyboard_check(ord("A"));
    jump    = keyboard_check_pressed(vk_space);
    jump_r  = keyboard_check_released(vk_space);
    paint   = keyboard_check_pressed(ord("Z"));
    
    //Tecla de correr
    run    = keyboard_check(vk_shift);
}



ativa_power_up = function()
{
    //Checando o power up da tinta
    power_tinta = global.tinta;
    
    
}

//Criando meu método de correr
ativa_correr = function()
{
    //Se a pessoa ativou a opção de correr
    //A base da minha velocidade vai ser a de correr
    if (run)
    {
        max_velh = velh_run;
    }
    //Caso contrário vai voltar a ser max velh
    else
    {
        max_velh = velh_walk;
    }
}

//Criando meu método de coyote jump
coyote_jump = function()
{
    checa_chao();
    //Não estou tocando no chão
    if (!chao)
    {
        coyoto_timer_atual--;
    }
    else //Estou tocando no chão, eu reseto o timer atual
    {
        coyoto_timer_atual = coyote_timer;
    }
}

//Criando o método de buffer do pulo
buffer_pulo = function()
{
    //Checando se a pessoa esta no chão
    checa_chao();
    //Pegando os inputs da pessoa
    pega_input();
    
    //Se eu não estou no chão e apertei o botão de pular
    if (!chao)
    {
        //Se eu apertei o pulo, eu quero ativar o buffer do pulo
        if (jump) pulo_timer_atual = pulo_timer;
            
        //Diminuindo o valor do pulo timer atual
        pulo_timer_atual--;
    }
    
}

//Método de movimentação
aplica_velocidade = function()
{
    
    //Checando se eu estou no chão
    checa_chao();
    
    //Aplicando os inputs na velh
    velh = (right - left) * max_velh;
    
    
    //Aplicando a gravidade
    //Se eu estou tocando no chão, eu aplico a gravidade à minha velv
    if (!chao)
    {
        velv += grav;
    }
    //Caso contrario eu zero o meu velv
    else //Estou no chão
    {
        
        velv = 0;
        
        //Vou arredondar a posição do y dele
        y = round(y);
        
        //Se eu apertei espaço OU eu tenho buffer do pulo, eu pulo
        if (jump || pulo_timer_atual)
        {
            velv = -max_velv;
            
            //zero meu pulo timer atual
            pulo_timer_atual = 0;
        }
        
    }
    
    
    //Limitando a velocidade vertical do player
    velv = clamp(velv, -max_velv, max_velv);
    //show_message(velv);
    
    
    

    
    
}


//Se eu estou DENTRO do one way, eu removo ele da colisão
removendo_colisao_one_way = function()
{
    //Checando se eu estou colidindo com o one way
    if (instance_place(x, y, obj_parede_one_way))
    {
        //Eu vou cehcar se ele esta na minha lista de colisão
        if (array_contains(colisoes, obj_parede_one_way))
        {
            //Eu vou remover ele da lista
            //Pegando o indice dele na lista
            var _ind = array_get_index(colisoes, obj_parede_one_way);
            //Removendo ele da lista
            array_delete(colisoes, _ind, 1);
            
        }
    }
}

ajusta_escala = function()
{
    //Se eu apertei para a direita, eu olho para a direita
    //Se meu velh não for 0, aí eu mudo o xscale
    if (velh != 0) dir = sign(velh);
}

movimento = function()
{
    //Usando o move and collide horizontal
    move_and_collide(velh, velv, colisoes, 4);
    
    //Usando o move and collide vertical
    move_and_collide(0, velv, colisoes, 24);
}

checa_chao = function()
{
    if (tempo_porta > 0) tempo_porta--;
    chao = place_meeting(x, y + 1, colisoes);
    
    //Checando se tem tinta
	if (chao)
	{
		toca_som_pulo = true;
	}
    
    chao_tinta = place_meeting(x, y + 1, tile_set_tinta);
}


//Método de pegar chave
pega_chave = function()
{
    chaves++;
}

//Crie o método troca sprite
//Faça ele receber uma sprite como argumento
//Faça ele trocar a sprite se ela ainda não esta sendo usada
//Faça ele resetar a animação
troca_sprite = function(_sprite = spr_parede)
{
    //Checando se eu aina não estou com a sprite correta
    if (sprite_index != _sprite)
    {
        //Troco a sprite
        sprite_index = _sprite;
        //Zero a animação
        image_index  = 0;
    }
}


//Criar um método para checar se a animação acabou
//Ele vai retornar TRUE se a animação acabou
acabou_animacao = function()
{
    var _spd = sprite_get_speed(sprite_index) / FPS;
    if (image_index + _spd >= image_number)
    {
        return true;
    }
}


//Pegando o power up
pega_powerup = function()
{
    estado = estado_powerup_inicio;
    
    //Avisando que eu posso usar o power up
    
}


//Método para fazer a transição de sprites
transicao_sprites = function()
{
    troca_sprite(lista_sprites[indice_sprite]);
        
        //Checando se acabou a animação da sprite atual
        if (acabou_animacao())
        {
            //Eu vou para a próxima sprite da lista
            //Checando se o array ainda tem mais sprites
            var _qtd = array_length(lista_sprites) - 1;
            //Se o indice da sprite ainda não chegou no limite do array, eu posso avançar na lista
            if (indice_sprite < _qtd)
            {
                indice_sprite++;
            }
        }   
}


troca_estado = function(_estado = estado_parado, _lista_sprites = [spr_player_idle])
{
    estado = _estado;
    indice_sprite = 0;
    lista_sprites = _lista_sprites;
}



//Criando um estado onde o player não tem controle
estado_sem_controle = function()
{
    transicao_sprites();
}

//Métodos os estados
estado_parado = function()
{
    //Se eu não vou usar o buffer do pulo, eu zero o velv
    if (pulo_timer_atual == 0) velv = 0;
    velh = 0;
    aplica_velocidade();
    
    //Código
    //Lógica
    //Do estado parado
    //troca_sprite(spr_player_idle);
    transicao_sprites();
    
    //Se eu apertei para a esquerda OU para a direita
    //Eu mudo para o estado de movendo
    if (right != left)
    {
        troca_estado(estado_movendo, [spr_player_iniciando_movimento, spr_player_move]);
    }
    
    //Pulei ou eu tenho pulo timer atual (buffer do pulo)
    if (jump || pulo_timer_atual)
    {
        troca_estado(estado_pulo, [spr_player_jump_inicia, spr_player_jump_cima]);
        instance_create_depth(x, y, depth - 1, obj_pulo_particula);
        
        //Eu me estico para cima
        efeito_squash(.4, 1.6);
    }
    //Se eu não estou tocando no chão
    //Eu estou no estado de pulo
    if (!chao)
    {
        estado = estado_pulo;
    }
    
    //Quando eu apertar o botão de poder
    //Eu entro na tinta
    //Só posso entrar no estado de tinta SE eu apertei o botão
    //E se eu já peguei o power up
    if (paint && power_tinta && chao_tinta)
    {
        estado = estado_tinta_entrar;
    }
}

abre_porta = function()
{
    //Checando se tem colisão com uma porta
    var _porta = instance_place(x +velh, y, obj_porta);
    
    //Se houve colisão com a porta eu faço alguma coisa
    if (_porta)
    {
        //Vou checar se eu tenho chaves
        //Checar se a porta ta no estado de fechada também
        //Checando se a porta ta no estado correto
        if (chaves > 0 && _porta.estado == "fechada" && tempo_porta <= 0)
        {
            //Vou destruir a porta
            //instance_destroy(_porta);
            //_porta.estado = "abrindo";
            //Ele vai avisar a porta que ela mudou de estado
            
            //Perco a minha chave
            chaves--;
            
            //Eu vou avisar a minha chave que ela precisa abrir a porta
            
            //Avisando a ultima chave que ela precisa ir até a porta para abrir ela.
            minhas_chaves[chaves].abrindo_porta = true;
            
            //Avisando para a chave qual é a porta que ela vai abrir
            minhas_chaves[chaves].porta_alvo = _porta;
            
            //Ativando o tempo para abrir a chave
            tempo_porta = timer_porta;
        }
    }
}


//Crie o estado de movendo
//Ele vai ficar na cor azul
estado_movendo = function()
{
    aplica_velocidade();
    //Eu ainda NÃO mudei a sprite
    //Eu não estou usando a sprite correta
    //show_message(sprite_get_name(sprite_index));
    //Definindo a sprite
    transicao_sprites();
    
    abre_porta();
    
    
    //Voltando para o estado de parado
    //Se eu não estou me movendo, eu provavelmente estou parado
    if (velh == 0)
    {
        troca_estado(estado_parado, [spr_player_parando, spr_player_idle]);
    }
    
    
    if (jump)
    {
        troca_estado(estado_pulo, [spr_player_jump_inicia, spr_player_jump_cima]);
        instance_create_depth(x, y, depth - 1, obj_pulo_particula);
        efeito_squash(.4, 1.6);
    }
    
    //Se eu não estou no chão, eu estou caindo, estou no estado de pulo
    if (!chao)
    {
        estado = estado_pulo;
    }
    
    //Se eu apertei o botão
    //Se eu tenho o power up
    //Se eu estou no tile da tinta
    if (paint && power_tinta && chao_tinta)
    {
        estado = estado_tinta_entrar;
        
    }
}

//Crie o estado de pulo
//Ele vai ficar na cor amarela
estado_pulo = function()
{
    
    static _inicio_pulo = true;
    
    if (_inicio_pulo)
    {
        //Acabei de entrar nesse estado
        //Eu vou diminuir a quantidade de pulos atual em 1
        qtd_pulos_atual--;
        
        //Setando o inicio do pulo como false
        _inicio_pulo = false;
        
        
    }
    
	if (toca_som_pulo && velv <= 0)
	{
		toca_som(som_pulo, .4);
		toca_som_pulo = false;
	}
	
    aplica_velocidade();
    //Definindo a sprite
    //troca_sprite(spr_player_jump_cima);
    
    
    
    //Se eu estou dentro do coyote timer, eu posso pular ainda
    //A pessoa tentou pular
    if (coyoto_timer_atual >= 0 && jump)
    {
        //Posso pular!
        velv = -max_velv;
        
        //Zerando meu coyote timer atual
        coyoto_timer_atual = 0;
        
        //Criando as particulas do pulo
        instance_create_depth(x, y, depth - 1, obj_pulo_particula);
        //Efeito do pulo
        efeito_squash(.4, 1.6);
    }
    
    //Se eu bater na parede subindo eu zero a minha velv
    //Só vou contar a parede e o tileset do level
    var _layer = layer_tilemap_get_id("tl_level");
    var _colisoes = [obj_parede, _layer];
    //Colidindo com o teto para cima ou para baixo
    if (place_meeting(x, y + sign(velv), _colisoes))
    {
        //Vou zerar o velv dele
        var _parar = true;
        //Se eu estou pulando para cima eu vou checar se eu preciso fazer uma
        //Corner corretion (correção da borda)
        if (velv < 0)
        {
            //Estou indo para cima, posso seguir com o código de corner correction
            //show_message("kkkkk");
            //Checando por todos os pixels da minha borda
            //Checando para a direita
            //Só vou fazer esse negócio todo SE eu estou parado ou indo para a direita
            
            
            for (var i = 0; i < corner_pixels; i++)
            {
                //Checando se eu NÃO estou colidindo em algum pixel do meu limite
                
                var _livre = !place_meeting(x + i, y + velv, _colisoes);
                //Ele achou espaço livre dentro do limite
                if (_livre)
                {
                    
                    //Se eu mudei a posição do player eu preciso
                    //Se alguma forma informar que eu não vou mais zerar o velv
                    //Porque ele tem que continuar subindo
                    _parar = false;
                    //Se tem espaço livre eu vou mover o player para aquela posição
                    x += i;
                    //Fiz o ajuste de posição eu PARO DE REPETIR O CÓDIGO
                    //PELO AMOR DE DEUS!!!
                    break;
                }
            }
            
            
            //Corner correction para a esquerda
            
            
            for (var i = 0;  i < corner_pixels; i++)
            {
                var _livre = !place_meeting(x - i, y + velv, _colisoes);
                
                //Se tem espaço livre, eu movo o player para aquele local
                if (_livre)
                {
                    //Não preciso parar de subir mais
                    _parar = false;
                    
                    //Vou mudar a posição X do player
                    x -= i;
                    
                    //Saio do laço de repetição
                    break;
                }
            }
        
            
            
        }
        
        if (_parar) velv = 0;
    }
    
    //Como eu sei que eu vou usar a sprite de jump cima (subindo)
    //Se eu estou subindo, minha velv é negativa
    if (velv < 0)
    {
        transicao_sprites();
        //Removendo o parede one way da lista
        //Se o objeto parede one way existe no meu array, eu removo ele
        //Checando se nas minha colisões o parede one way esta lá
        if (array_contains(colisoes, obj_parede_one_way))
        {
            //Removendo o parede one way das minhas colisões
            //Achando a posição do parede one way
            var _ind = array_get_index(colisoes, obj_parede_one_way);
            //Deletando o meu mano one way do array
            array_delete(colisoes, _ind, 1);
        }
        
        
        //Se por ventura a pessoa soltou o botão de pular
        //Eu paro de subir
        if (jump_r)
        {
            //Corto pela metade o valor do velv dele
            velv *= 0.5;
        }
    }
    //Como eu sei que eu vou usar a sprite de jump baixo (caindo)
    else //Estou caindo - Velv é positiva ou 0
    {
        //Fazendo ele trocar a lista de sprites
        lista_sprites = [spr_player_jump_inicio_queda, spr_player_jump_baixo];
        transicao_sprites();
        //Se eu não estou tocando na parede one way
        //Eu preciso checar que eu NÃO estou colidindo com a parede one way
        if (!place_meeting(x, y, obj_parede_one_way))
        {
            //Eu vou colocar o parede one way na minha array
            //Só coloco ele no array SE ele ainda não esta no array
            //Checando se o parede one way NÃO esta no meu array
            if (!array_contains(colisoes, obj_parede_one_way))
            {
                array_push(colisoes, obj_parede_one_way);
            }
            
            //colisoes[2] = obj_parede_one_way;
        }
    }
    
    
    //Se eu apertei o botão de pular, eu pulo de novo
    //E eu tenho quantidade de pulos para continuar pulando
    if (jump && qtd_pulos_atual > 0 && global.pulo)
    {
        //Ajustando as sprites
        lista_sprites = [spr_player_jump_inicia, spr_player_jump_cima];
        transicao_sprites();
        
		toca_som(som_pulo, .4);
		
        velv = -max_velv;
        qtd_pulos_atual--;
    }
    
    
    
    //Como eu sei que eu voltei para o estado de parado?
    //Se eu toquei no chão, eu não estou mais pulando
    if (chao)
    {
        //Avisando que o inicio do pulo vai ser true novamente
        _inicio_pulo = true;
        
        //Resetando a quantidade de pulo
        qtd_pulos_atual = qtd_pulos;
        
        troca_estado(estado_parado, [spr_player_pousando, spr_player_idle]);
        instance_create_depth(x, y, depth - 1, obj_pouso_particula);
        
        //Vou ficar meio achatado
        efeito_squash(1.5, 0.5);
    }
}


//Crie os estados da animação no começo
estado_powerup_inicio = function()
{
    troca_sprite(spr_player_powerup_inicio);
    
    //Meu mano tem que ficar parado
    velh = 0;
    velv = 0;
    
    //Indo para o meio da animação
    //Quando a animação desse estado acabou, eu mudo de estado
    if (acabou_animacao())
    {
        estado = estado_powerup_meio;
    }
    
}
//Meio
estado_powerup_meio = function()
{
    troca_sprite(spr_player_powerup_meio);
    
    
    
    //Eu só vou sair do estado de power up meio SE não existe mais particula do power up
    if (!instance_exists(obj_particula_powerup))
    {
        estado = estado_powerup_fim;
    }
    
    
    //Trocando para o estado do fim da animação
    //if (acabou_animacao())
    //{
        //estado = estado_powerup_fim;
    //}
}

//Fim
estado_powerup_fim = function()
{
    troca_sprite(spr_player_powerup_fim);
    
    
    //Finalizando a animação
    if (acabou_animacao())
    {
        troca_estado(estado_parado, [spr_player_idle]);
    }
}

//Estado entrando na tinta
//Entrar no estado do loop da tinta
estado_tinta_entrar = function()
{
    velh = 0;
    troca_sprite(spr_player_tinta_entrar);
    
    //Se a minha particula não existe, eu crio ela
    if (!instance_exists(obj_tinta_entrar_particula))
    {
        //Crio a minha particula
        instance_create_depth(x, y, depth - 1, obj_tinta_entrar_particula);
    }
    
    //Acabou a animação de entrando na tinta
    //Eu entro na tinta
    if (acabou_animacao())
    {
        troca_estado(estado_tinta_loop, [spr_player_tinta_inicio, spr_player_tinta_loop]);
    }
}



//Estado do tinta loop
//Esse estado quando eu apertar o botão de poder?
//Ele vai ir para o estado de tinta sair
estado_tinta_loop = function()
{
    transicao_sprites();
    aplica_velocidade();
    
    
    //Garantindo que mesmo que o jogador aperte o botão de pulo
    //O velv não vai ser alterado
    velv = 0;
    
    //Eu vou ter a mascara de colisão menor
    mask_index = spr_player_tinta_loop;
    
    
    //Se na minha frente embaixo de mim não tiver chão, eu zero meu velh
    var _parar = !place_meeting(x + (sign(velh) * 18), y + 1, tile_set_tinta);
    if (_parar)
    {
        velh = 0;
    }
    
    //Se eu apertei o botão de tinta, eu saio da tinta
    if (paint)
    {
        troca_estado(estado_tinta_sair, [spr_player_tinta_fim, spr_player_tinta_sair]);
        //Criando as particulas
        instance_create_depth(x, y, depth - 1, obj_tinta_sair_particula);
    }
}


//Estado saindo da tinta
//Terminou a animação, ele vai para o estado de parado
estado_tinta_sair = function()
{
    velh = 0;
    
    
    
    //A minhas mascara de colisão volta ao original
    mask_index = spr_player_idle;
    
    
    
    //Terminou a animação, eu vou para o estado de parado
    //Checando se ele chegou no final do array
    var _qtd = array_length(lista_sprites) - 1;
    if (acabou_animacao() && indice_sprite >= _qtd)
    {
        troca_estado(estado_parado, [spr_player_idle]);
    }
    
    transicao_sprites();
}


#endregion


#region debug


view_player = noone;

//Método de debug do jogo
roda_debug = function()
{
    
    
    //Se não ta em debug, ele só sai do método
    //if (!global.debug) return;
        
    
    show_debug_overlay(1);
    
    
    //Criando meus bagui de debug dentro do view
    view_player = dbg_view("View player", 1, 40, 100, 300, 400);
    
    //Vendo as informações da minha velv
    var _ref_velv = ref_create(id, "velv");
    dbg_watch(_ref_velv, "velv");
    
    //Podendo mudar o max velv
    dbg_slider(ref_create(id, "max_velv"), 0, 10, "Max velv", .1);
    
    //Podendo mudar o valor da grav
    dbg_slider(ref_create(id, "grav"), 0, 1, "Gravidade", 0.01);    
}

ativa_debug = function()
{
    
    //SE o jogo não esta no modo debug, ele não faz nada do debug
    if (!DEBUG_MODE) return
    
    
    //Alterando o modo debug
    if (keyboard_check_pressed(vk_tab))
    {
        //Se o debug é true ele vira false, se é false ele vira true
        global.debug = !global.debug;
        
        
        //Se o jogo esta no modo debug, eu rodo o debug
        if (global.debug)
        {
            roda_debug();
        }
        else
        {
            //Desativo o debug overlay
            show_debug_overlay(0);
            //Se a minha view existe e eu não estou no modo debug, eu deleto ela
            if (dbg_view_exists(view_player))
            {
                dbg_view_delete(view_player);
            }
        }
        
    }    
    
    
}

#endregion


//As ultimas coisas que eu faço no meu create
//Definindo o estado inicial do player
estado = estado_parado;



//Definindo a minha posição inicial
inicia_player();