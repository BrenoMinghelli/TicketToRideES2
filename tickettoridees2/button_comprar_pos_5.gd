extends Button

#comentarios no botao da pos1
@onready var jogo = get_parent()
@onready var baralho =jogo.get_node("Baralho")

func atualizar_texto():
	var control = baralho.get_cor_carta(4)
	text = "Comprar \n%s" %control
	

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))
	
func _on_pressed():
	jogo.comprar_p1(4)
	jogo.hide_button_compra()
	jogo.appear_button_action()
