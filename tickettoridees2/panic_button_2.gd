extends Button

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

#ta aqui só pra fechar o jogo, vai ser retirado na versao final
func _on_pressed():
	get_tree().quit()
