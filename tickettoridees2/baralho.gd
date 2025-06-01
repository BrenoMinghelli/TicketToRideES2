extends Node
class_name Baralho

var cartas: Array[Carta]

#cria o baralho
func inicializar_baralho():
	var cores_normais: Array[Carta.Cor] = [
		Carta.Cor.Rosa, Carta.Cor.Branca, Carta.Cor.Azul,
		Carta.Cor.Amarela, Carta.Cor.Laranja, Carta.Cor.Preta,
		Carta.Cor.Vermelha, Carta.Cor.Verde
	]
	#seta a cor da carta + a textura, que pode ser ou nao usado futuramente
	for cor in cores_normais:
		var nome_cor: String = Carta.Cor.keys()[cor]
		var textura_path: String = "res://assets/cartas/%s.png" % nome_cor
		var textura: Texture2D = load(textura_path)
		#adiciona 12 cartas de cada no baralho
		for i in range(12):
			var nova_carta: Carta = Carta.new(cor,textura)
			cartas.append(nova_carta)
	#faz a mesma coisa com a carta coringa, mas adiciona 14
	var textura_coringa: Texture2D = preload("res://assets/cartas/Coringa.png")
	for i in range(14):
		var coringa: Carta = Carta.new(Carta.Cor.Coringa, textura_coringa)
		cartas.append(coringa)

func embaralhar():
	cartas.shuffle()

#print para debug
func imprimir_baralho():
	print("=== BARALHO COMPLETO ===")
	print("Total de cartas: ", cartas.size())
	for i in range(cartas.size()):
		var carta = cartas[i]
		print("Carta %d: %s (Cor: %s)" % [i+1,
		 carta.textura.resource_path.get_file(), Carta.Cor.keys()[carta.cor]])

#retira a carta da posição especificada e retorna ela
func comprar_carta_baralho(pos:int):
	if pos < 0 or pos >= cartas.size():
		push_error("Posição invalida")
		return null
	var carta = cartas[pos]
	cartas.remove_at(pos)
	return carta

func quantidade_de_cartas():
	return cartas.size

#get necessario para atualizar os botoes
func get_cor_carta(pos:int):
	var control = cartas[pos].get_cor()
	return control

func _ready():
	inicializar_baralho()
	embaralhar()
