extends Node2D


var player_number = 0
var rotas: Array[Rota]
var rota_selecionada: int = -1

# variáveis dos outros nodes para as funções funcionarem adequadamente
@onready var baralho = $Baralho
@onready var baralho_destinos := BaralhoDestinos.new()
@onready var tabuleiro = $Tabuleiro
@onready var j1 = $Jogador
@onready var botao_comprar = $Button_comprar
@onready var botao_comprar_topo = $Button_comprar_topo
@onready var botao_comprar_pos_1 = $Button_comprar_pos1
@onready var botao_comprar_pos_2 = $Button_comprar_pos2
@onready var botao_comprar_pos_3 = $Button_comprar_pos3
@onready var botao_comprar_pos_4 = $Button_comprar_pos4
@onready var botao_comprar_pos_5 = $Button_comprar_pos5
@onready var botao_conquistar = $Button_conq_rota

@onready var label_mao = $Scroll_mao/Label_mao_jogador


func hide_button_action():
	botao_comprar.visible = false
	botao_conquistar.visible = false

func hide_button_compra():
	botao_comprar_topo.visible = false
	botao_comprar_pos_1.visible = false
	botao_comprar_pos_2.visible = false
	botao_comprar_pos_3.visible = false
	botao_comprar_pos_4.visible = false
	botao_comprar_pos_5.visible = false

func appear_button_action():
	botao_comprar.visible = true
	botao_conquistar.visible = true

func appear_button_compra():
	botao_comprar_topo.visible = true
	botao_comprar_pos_1.visible = true
	botao_comprar_pos_2.visible = true
	botao_comprar_pos_3.visible = true
	botao_comprar_pos_4.visible = true
	botao_comprar_pos_5.visible = true

func comprar_p1(pos: int):
	j1.comprar_carta_p1(pos, baralho)
	j1.imprimir_mao()
	label_mao.text = j1.atualizar_ui_mao()

func _on_botao_conquistar_pressed() -> void:
	if rota_selecionada < 0 or rota_selecionada >= rotas.size():
		print("Nenhuma rota selecionada para conquistar!")
		return
	var rota = rotas[rota_selecionada]

	if rota.conquistada:
		print("A rota já foi conquistada por outro jogador!")
		return

	var cor_da_rota = rota.cor
	# print(rota.Cor)
	var custo = rota.tamanho
	var contagem = j1.contar_para_rota(cor_da_rota)

	if contagem["cor"] + contagem["coringa"] < custo:
		print("Você não tem cartas suficientes para conquistar esta rota!")
		return

	var pagou = j1.gastar_cartas_para_rota(cor_da_rota, custo)
	if not pagou:
		print("Erro ao descartar cartas!")
		return

	rota.conquistar(j1.id)

	j1.adicionar_pontos(rota.pontos)
	print("Rota conquistada! Você ganhou %d pontos." % rota.pontos)

	label_mao.text = j1.atualizar_ui_mao()

	rota_selecionada = -1
	
	j1.imprimir_mao()

func _ready():
	hide_button_compra()
	print(player_number)
	baralho.imprimir_baralho()
	
	add_child(baralho_destinos)
	baralho_destinos.inicializar_baralho()
	baralho_destinos.embaralhar()
	baralho_destinos.imprimir_baralho()

	for i in range(5):
		comprar_p1(5)

	rotas = tabuleiro.init_rotas()

	for i in range(rotas.size()):
		var ro = rotas[i]
		print("Rota: %d - %s - %s, Tamanho = %d, Cor = %s"
			% [i+1, ro.cidade1, ro.cidade2, ro.tamanho, Rota.Cor.keys()[ro.cor]])

	#se quiser testar em alguma rota basta mudar aqui.
	rota_selecionada = -1
	botao_conquistar.pressed.connect(_on_botao_conquistar_pressed)
