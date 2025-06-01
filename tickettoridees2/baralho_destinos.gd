extends Node
class_name BaralhoDestinos

var cartas: Array[CartaDestino] = []

func inicializar_baralho():
	cartas.clear()
	# Editar/expandir conforme o mapa do jogo
	var dados: Array = [
		["Tabatinga",     "Boa Vista",            13],
		["Tabatinga",     "Manaus",                6],
		["Tabatinga",     "Porto Velho",           4],
		["Porto Velho",   "Manaus",                3],
		["Porto Velho",   "Rio Branco",            3],
		["Porto Velho",   "Vilhena",               2],
		["Vilhena",       "Cuiabá",                2],
		["Cuiabá",        "Brasília",              4],
		["Cuiabá",        "Aquidauana",            3],
		["Aquidauana",    "Maringá",               4],
		["Maringá",       "São José do Rio Preto", 2],
		["São José do Rio Preto", "São Paulo",     4],
		["São José do Rio Preto", "Bom Jesus da Lapa", 4],
		["Maringá",       "Curitiba",              3],
		["Curitiba",      "São Paulo",             3],
		["São Paulo",     "Belo Horizonte",        3],
		["Belo Horizonte","Niterói",               1],
		["Niterói",       "Nova Viçosa",           4],
		["Nova Viçosa",   "Salvador",              3],
		["Salvador",      "Maceió",                3],
		["Maceió",        "Natal",                 4],
		["Natal",         "Fortaleza",             3],
		["Fortaleza",     "Crato",                 1],
		["Crato",         "Teresina",              4],
		["Teresina",      "Imperatriz",            3],
		["Imperatriz",    "Belém",                 4],
		["Belém",         "Alenquer",              3],
		["Alenquer",      "Manaus",                3],
		["Manaus",        "Boa Vista",             2],
		["Boa Vista",     "Cuiabá",                6]
	]
	for d in dados:
		cartas.append(CartaDestino.new(d[0], d[1], d[2]))

# ---------------------------------------------------------
# Operações
# ---------------------------------------------------------
func embaralhar():
	cartas.shuffle()

func quantidade() -> int:
	return cartas.size()

func comprar_carta() -> CartaDestino:
	if cartas.is_empty():
		return null
	return cartas.pop_back()

func comprar_varias(qtd: int) -> Array[CartaDestino]:
	var compradas: Array[CartaDestino] = []
	for i in range(min(qtd, cartas.size())):
		compradas.append(comprar_carta())
	return compradas

func imprimir_baralho():
	print("=== BARALHO DE DESTINOS ===")
	print("Total de cartas: ", quantidade())
	for i in range(quantidade()):
		var c: CartaDestino = cartas[i]
		print("%d) %s – %s (%d pts)" % [i+1, c.cidade1, c.cidade2, c.pontos])
		
func _ready():
	inicializar_baralho()
	embaralhar()
