extends Button

@onready var jogo = get_parent()

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	jogo.iniciar_compra_destinos()   # chama a lógica acima
