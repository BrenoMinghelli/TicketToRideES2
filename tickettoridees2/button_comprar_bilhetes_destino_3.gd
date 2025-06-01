extends Button
@export var indice: int = 2          # defina 0, 1 ou 2 no Inspetor

@onready var jogo = get_parent()

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	jogo.escolher_destino(indice)
