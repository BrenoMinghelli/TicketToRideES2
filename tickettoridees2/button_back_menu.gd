extends Button

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

#retorna para a tela inicial
func _on_pressed():
	get_tree().change_scene_to_file("res://tela_inicial.tscn")
