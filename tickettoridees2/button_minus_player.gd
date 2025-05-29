extends Button

@onready var tela = get_parent()

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

#chama a função de reduzir o numero de jogadores
func _on_pressed():
	tela.sub_pn()
