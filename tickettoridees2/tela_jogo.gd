extends Node2D

#var que recebe a quantidade de jogadores
var player_number = 0

#variaveis dos outros nodes para as funções funcionarem adequadamente
@onready var baralho = $Baralho
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

#esconde os botoes das ações que o jogador pode tomar no seu turno
func hide_button_action():
	botao_comprar.visible = false
	botao_conquistar.visible = false

#esconde os botoes das opções de compra do jogador
func hide_button_compra():
	botao_comprar_topo.visible = false
	botao_comprar_pos_1.visible = false
	botao_comprar_pos_2.visible = false
	botao_comprar_pos_3.visible = false
	botao_comprar_pos_4.visible = false
	botao_comprar_pos_5.visible = false

#faz aparecer os botões das ações possiveis
func appear_button_action():
	botao_comprar.visible = true
	botao_conquistar.visible = true

#faz aparecer quais cartas o jogador pode comprar
func appear_button_compra():
	botao_comprar_topo.visible = true
	botao_comprar_pos_1.visible = true
	botao_comprar_pos_2.visible = true
	botao_comprar_pos_3.visible = true
	botao_comprar_pos_4.visible = true
	botao_comprar_pos_5.visible = true
	

#adiciona a mão do jogador uma carta da posição N do baralho
#importante pois as 5 primeiras cartas do baralho sempre sao reveladas e
#pode ser escolhidas diretamente, enquanto a sexta fica escondida
func comprar_p1(pos:int):
	j1.comprar_carta_p1(pos,baralho)
	#print para debug
	j1.imprimir_mao()
	#atualiza a mão do jogador na tela
	label_mao.text = j1.atualizar_ui_mao()


func _ready():
	#esconde os botoes que nao aparecem inicialmente
	hide_button_compra()
	#print para debug
	print(player_number)
	#print para debug
	baralho.imprimir_baralho()
	#compra da mao inicial do jogador
	for i in range(5):
		comprar_p1(5)
	
