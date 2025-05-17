extends Button

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

func _on_pressed():
	get_tree().change_scene_to_file("res://tela_jogadores.tscn")
