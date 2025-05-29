extends Node2D

#var necessarias para o funcionamento
var player_number: int = 2
@onready var Label_pn: Label = $Label_player_number

#quando entrar na tela atualiza o numero de jogadores em 2
func _ready():
	atualizar_label()

#função para atualizar o valor da quantidade de jogadores na tela
func atualizar_label():
	Label_pn.text = str(player_number)

#caso tenha 4 ou menos jogadores, aumenta a quantidade em 1 e atualiza a tela
func add_pn():
	if player_number < 5:
		player_number = player_number+1
		atualizar_label()

#igual ao add, mas subtrai se tiver 3 ou mais
func sub_pn():
	if player_number > 2:
		player_number = player_number -1
		atualizar_label()

#get para o botao de iniciar partida
func return_pn():
	return player_number
