//primeira tarefa
//criar uma historia apartir de 5 show_massage

/*
show_message("Iniciando o modulo de programação do curso none class")
show_message("Curso top")
show_message("Porem esse modelo de varias aulas curtas nao curti")
show_message("Eu, particularmente, prefiriria aulas mais longas, de uns 20 minutos")
show_message("Aqui acaba os 5 show_message")
*/

//segunda tarefa
//mostrar dados apartir dos show_massage

/*
show_message(string_concat("Idade: ", 20))
show_message("Estado: RS")
show_message(string_concat("Altura: ", 1.80, "m"))
*/

//terceira tarefa
//fazer tarefa 2 usando 4 variaves

/*
nome = "Bruno"
idade = 20
estado = "RS"
altura = 1.8

show_message(string_concat("Nome: ", nome))
show_message(string_concat("Idade: ", idade))
show_message(string_concat("Estado: ", estado))
show_message(string_concat("Altura: ", altura, "m"))
*/

//quarta atividade
//criar variavel boolean

/*
sim = true
show_message(sim)
*/

//quinta atividade
//capturar string

/*
nome = get_string("Digite seu nome: ", "")
idade = get_string("Digite sua idade: ", "")
show_message_async("Nome: " + nome + "\nIdade: " + idade)
*/

//sexta atividade
//capturar int e usar funcao string

/*
nome = get_string("Digite seu nome: ", "")
idade = get_integer("Digite sua idade: ", "")
show_message_async("Nome: " + nome + "\nIdade: " + string(idade))
*/

//show question
/*
continuar = show_question("True ou False")
show_message(continuar)
*/

#region operadores

//lista 
/*

 + soma
 - subtrção
 * multiplica
 / divide
 % resto da divisao

*/

//show_message(5 % 3)

#endregion

//setima atividade
//fazer calculo dos gastos mensais

/*
gastos = [

	{gasto_id: "luz", gasto_valor: 300},
	{gasto_id: "agua", gasto_valor: 200},
	{gasto_id: "internet", gasto_valor: 100},
	{gasto_id: "aluguel", gasto_valor: 1000},

]

ganhos = [

	{ganho_id: "salario", valor: 1800},
	{ganho_id: "hora_extra", valor: 300},

]

valor_gastos = 0
for( i = 0; i < array_length(gastos); i++){

	valor_gastos += gastos[i].gasto_valor
	
}

valor_ganhos = 0
for( i = 0; i < array_length(ganhos); i++){

	valor_ganhos += ganhos[i].valor
	
}

valor_final = valor_ganhos - valor_gastos
show_message_async(valor_final)
*/

//atividade oitava
//calculo de media apartir get_integer
/*
max_notas = 4
notas = []

for (i = 0; i < max_notas; i++){

	array_push(notas, get_integer(string_concat("Digite o valor da nota", i, ": "), ""))
	if i = 0 media_final = notas[i]
	else media_final = (media_final + notas[i]) / 2
	
	
}

show_message(media_final)
*/

#region operadores relacionais

//sempre rotorna boolean

//lista 
/*

 > maior que
 < menor que
 = igual
 <= menor ou igual
 >= maior ou igual
 != diferente
 

*/

#endregion

//atividade nove
//checa se ta acima da media

/*
media = 7
max_notas = 4
notas = []

for (i = 0; i < max_notas; i++){

	array_push(notas, get_integer(string_concat("Digite o valor da nota", i, ": "), ""))
	if i = 0 media_final = notas[i]
	else media_final = (media_final + notas[i]) / 2
	
	
}

show_message(media_final >= media)
*/

//atividade 10
//usar if

/*
media = 7
max_notas = 4
notas = []

for (i = 0; i < max_notas; i++){

	array_push(notas, get_integer(string_concat("Digite o valor da nota", i, ": "), ""))
	if i = 0 media_final = notas[i]
	else media_final = (media_final + notas[i]) / 2
	
	
}

if(media_final >= media) show_message("acima da media")
if(media_final < media) show_message("abaixo da media")
*/

//atividade 11
//usar if e else

/*
media = 7
max_notas = 4
notas = []

for (i = 0; i < max_notas; i++){

	array_push(notas, get_integer(string_concat("Digite o valor da nota", i, ": "), ""))
	if i = 0 media_final = notas[i]
	else media_final = (media_final + notas[i]) / 2
	
	
}

if(media_final >= media) show_message("acima da media")
else show_message("abaixo da media")
*/

#region operadores logicos

//retornam boolean, porem só trabalham com valores boolean

// &&
// ||
// !

#endregion

//atividade algum numero
//usar and em um if
/*
var1 = true
var2 = false

if var1 and var2 show_message("aha")
*/

//atividade (algum numero + 1)
//usar or em um if
/*
var1 = true
var2 = false

if var1 or var2 show_message("aha")
*/

//final
//problema do cachorro quente

fome = show_question("Vc esta com fome?")

preco = 10

if fome{
	
	dinheiro = get_integer("quanto de dinheiro vc tem?", "")
	if dinheiro > preco{
		
		dinheiro -= preco
		show_message(string_concat("voce comprou cachorro quente e ficou com: ", dinheiro, "R$"))

	}
	else{
		
		fiado = show_question("vendedor vende fiado?")

		if fiado{
	
			show_message("voce comprou cachorro quente fiado")
	
		}
		else{
	
			show_message("bah")
	
		}
	}
}
else{
	
		show_message("top")
	
}



