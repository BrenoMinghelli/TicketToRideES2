extends Node2D

var player_number: int = 2
@onready var Label_pn: Label = $Label_player_number

func _ready():
	atualizar_label()
	
func atualizar_label():
	Label_pn.text = str(player_number)
	
func add_pn():
	if player_number < 5:
		player_number = player_number+1
		atualizar_label()

func sub_pn():
	if player_number > 2:
		player_number = player_number -1
		atualizar_label()
		
func return_pn():
	return player_number
