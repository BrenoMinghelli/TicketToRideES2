extends Button

@onready var jogo = get_parent()

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))


#compra a carta da posição 5 do baralho / do topo não revelado
func _on_pressed():
	jogo.comprar_p1(5)
	#atualiza os visuais dos botoes
	jogo.hide_button_compra()
	jogo.appear_button_action()
