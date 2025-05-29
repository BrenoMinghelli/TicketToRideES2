extends Node2D

#array da mao do jogador
var mao: Array[Carta]
@onready var baralho = get_parent().get_node("Baralho")

#retorna o texto para atualizar a mao do jogador na tela
func atualizar_ui_mao():
	var texto_mao = "Cartas na mão:\n"
	for i in range(mao.size()):
		texto_mao += "- %s \n" % mao[i].get_cor()
	return texto_mao

#adiciona a carta comprada a mão do jogador
func comprar_carta_p1(pos:int,baralho: Baralho):
	var control = baralho.comprar_carta_baralho(pos)
	mao.append(control)
	return 0

#print para debug
func imprimir_mao():
	print("=== MÃO DO JOGADOR ===")
	print("Total de cartas: ", mao.size())
	for i in range(mao.size()):
		var carta = mao[i]
		print("Carta %d: %s (Cor: %s)" % [i+1,
		 carta.textura.resource_path.get_file(), Carta.Cor.keys()[carta.cor]])
