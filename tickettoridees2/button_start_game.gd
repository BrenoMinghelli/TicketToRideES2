extends Button

@onready var tela = get_parent()

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))
	
func _on_pressed():
	var next_scene = load("res://tela_jogo.tscn").instantiate()
	var controle = tela.return_pn()
	next_scene.set("player_number", controle) 
	get_tree().root.add_child(next_scene)
	get_tree().current_scene.queue_free()
	get_tree().current_scene = next_scene
