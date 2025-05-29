extends Button

@onready var jogo = get_parent()
@onready var baralho =jogo.get_node("Baralho")

#função para atualizar o texto de si mesmo
func atualizar_texto():
	var control = baralho.get_cor_carta(0)
	text = "Comprar\n %s" %control
	

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

#faz o jogador comprar a carta da posição desse botao e atualiza o visual
func _on_pressed():
	jogo.comprar_p1(0)
	jogo.hide_button_compra()
	jogo.appear_button_action()
