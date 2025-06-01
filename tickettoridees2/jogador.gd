extends Node2D


var mao: Array[Carta] = []
var pontuacao: int = 0
var id: int = 1

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
		
func contar_para_rota(cor_rota: int) -> Dictionary:
	var qtd_cor: int = 0
	var qtd_coringa: int = 0
	var carta_cor_esperada = cor_rota - 1

	for carta in mao:
		if carta.cor == carta_cor_esperada:
			qtd_cor += 1
			#print(carta.cor, cor_rota, "Somou cor")
		elif carta.cor == Carta.Cor.Coringa:
			qtd_coringa += 1

	#print(cor_rota, "Cor da rota (índice de Rota.Cor)")
	#print(qtd_cor + qtd_coringa, "Quantidade total de cartas. Rota == sua mao")
	return { "cor": qtd_cor, "coringa": qtd_coringa }
	
func gastar_cartas_para_rota(cor_rota: int, custo: int) -> bool:
	var carta_cor_esperada = cor_rota - 1
	var contagens = contar_para_rota(cor_rota)
	var usar_cor = min(contagens["cor"], custo)
	var usar_coringa = custo - usar_cor

	if contagens["cor"] + contagens["coringa"] < custo:
		return false

	var removidas = 0
	for i in range(mao.size() - 1, -1, -1):
		if removidas >= usar_cor:
			break
		if mao[i].cor == carta_cor_esperada:
			mao.remove_at(i)
			removidas += 1

	var removidas_coringo = 0
	if usar_coringa > 0:
		for i in range(mao.size() - 1, -1, -1):
			if removidas_coringo >= usar_coringa:
				break
			if mao[i].cor == Carta.Cor.Coringa:
				mao.remove_at(i)
				removidas_coringo += 1

	return true
	
	
func adicionar_pontos(pontos_rota: int) -> void:
	pontuacao += pontos_rota
