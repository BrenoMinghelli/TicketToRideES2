extends Button

#var necessárias para atualizar o texto desses botoes
#sempre que o jogador escolher a ação de comprar uma carta
@onready var jogo = get_parent()
@onready var b_pos1 = get_parent().get_node("Button_comprar_pos1")
@onready var b_pos2 = get_parent().get_node("Button_comprar_pos2")
@onready var b_pos3 = get_parent().get_node("Button_comprar_pos3")
@onready var b_pos4 = get_parent().get_node("Button_comprar_pos4")
@onready var b_pos5 = get_parent().get_node("Button_comprar_pos5")

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))
	
func _on_pressed():
	#atualiza os texto
	b_pos1.atualizar_texto()
	b_pos2.atualizar_texto()
	b_pos3.atualizar_texto()
	b_pos4.atualizar_texto()
	b_pos5.atualizar_texto()
	#esconde os botoões de ação
	jogo.hide_button_action()
	#aparece os botoes de cartas para comprar
	jogo.appear_button_compra()
