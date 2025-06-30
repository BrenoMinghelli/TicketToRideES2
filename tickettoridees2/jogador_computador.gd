extends Jogador
class_name JogadorComputador

var baralho_destinos: BaralhoDestinos
var rotas_disponiveis: Array[Rota]
var destinos: Array[CartaDestino] = []

func setup(baralho_d: BaralhoDestinos, rotas: Array[Rota]) -> void:
	baralho_destinos = baralho_d
	rotas_disponiveis = rotas

func tomar_turno() -> void:
	print("IA %d está tomando turno..." % id)
	
	# Tentar conquistar uma rota viável
	if tentar_conquistar_rota():
		return
	
	# Se não conseguiu conquistar, comprar uma carta ou destino
	if randf() < 0.9:  # 70% de chance de comprar carta
		comprar_carta_aleatoria()
	elif destinos.size() < 3:  # Se tiver menos de 3 destinos
		comprar_destino_aleatorio()

func tentar_conquistar_rota() -> bool:
	# Filtrar rotas disponíveis e viáveis
	var rotas_viáveis = []
	for rota in rotas_disponiveis:
		# Pular rotas já conquistadas
		if rota.conquistada:
			continue
			
		# Calcular recursos necessários
		var contagem = contar_para_rota(rota.cor)
		var recursos = contagem["cor"] + contagem["coringa"]
		
		# Verificar se tem cartas suficientes
		if recursos >= rota.tamanho:
			rotas_viáveis.append(rota)
	
	if rotas_viáveis.is_empty():
		return false
	
	# Escolher uma rota aleatória das viáveis
	var rota_escolhida = rotas_viáveis[randi() % rotas_viáveis.size()]
	
	# Conquistar a rota
	if gastar_cartas_para_rota(rota_escolhida.cor, rota_escolhida.tamanho):
		rota_escolhida.conquistar(id)
		adicionar_pontos(rota_escolhida.pontos)
		print("IA %d conquistou rota: %s - %s" % [id, rota_escolhida.cidade1, rota_escolhida.cidade2])
		return true
	
	return false

func comprar_carta_aleatoria() -> void:
	if baralho.cartas.is_empty():
		print("Baralho vazio! IA %d não pode comprar carta." % id)
		return
	
	# Escolher uma posição aleatória no baralho
	var pos_compra = randi() % baralho.cartas.size()
	comprar_carta_p1(pos_compra, baralho)
	print("IA %d comprou uma carta." % id)

func comprar_destino_aleatorio() -> void:
	if baralho_destinos.quantidade() < 3:
		print("Não há destinos suficientes! IA %d não pode comprar destino." % id)
		return
	
	# Comprar 3 destinos e escolher um aleatoriamente
	var oferta = baralho_destinos.comprar_varias(3)
	if oferta.is_empty():
		return
		
	var destino_escolhido = oferta[randi() % oferta.size()]
	destinos.append(destino_escolhido)
	print("IA %d comprou destino: %s - %s" % [id, destino_escolhido.cidade1, destino_escolhido.cidade2])
