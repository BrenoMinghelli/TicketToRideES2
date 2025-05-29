extends Button


func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

#vai para a tela de escolher quantidade de jogadores
func _on_pressed():
	get_tree().change_scene_to_file("res://tela_jogadores.tscn")
