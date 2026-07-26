/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//Criando a minha particula


//Criando meu sistema de particulas, no lugar errado!!
ps = part_system_create(ps_brilho_chamas);

part_system_position(ps, x, y);



//Eu vou criar a sprite da tocha na camada "decorações fundo"
layer_sprite_create("Decoracoes_fundo", x, y, sprite_index);
