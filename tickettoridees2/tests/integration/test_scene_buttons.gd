extends "res://addons/gut/test.gd"

var scene: Node2D

func before_each() -> void:
	scene = preload("res://tela_jogadores.tscn").instantiate()
	get_tree().get_root().add_child(scene)

func after_each() -> void:
	scene.queue_free()

func test_press_plus_button_updates_label_and_value() -> void:
	var btn = scene.get_node("Button_plus_player") as Button
	btn.emit_signal("pressed")
	assert_eq(scene.player_number, 3)
	assert_eq(scene.get_node("Label_player_number").text, "3")

func test_press_minus_button_updates_label_and_value() -> void:
	scene.player_number = 3
	var btn = scene.get_node("Button_minus_player") as Button
	btn.emit_signal("pressed")
	assert_eq(scene.player_number, 2)
	assert_eq(scene.get_node("Label_player_number").text, "2")
