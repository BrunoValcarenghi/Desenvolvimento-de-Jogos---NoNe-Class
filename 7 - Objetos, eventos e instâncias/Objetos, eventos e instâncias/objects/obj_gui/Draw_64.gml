draw_set_halign(0)
draw_set_valign(0)
draw_text(32, 32, string_concat("Pontos: ", global.pontos))
if global.atual = noone{
	draw_text(32, 64, "Carro Atual: Nenhum")
}
else{
	draw_text(32, 64, string_concat("Carro Atual: ", global.atual.nome))
}