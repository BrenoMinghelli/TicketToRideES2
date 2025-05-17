extends Button

func _ready():
	pressed.connect(Callable(self,"_on_pressed"))

func _on_pressed():
	get_tree().quit()
