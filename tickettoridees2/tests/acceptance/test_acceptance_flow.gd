extends "res://addons/gut/test.gd"

func test_full_ui_flow_returns_to_menu() -> void:
	var menu = preload("res://tela_jogadores.tscn").instantiate()
	get_tree().get_root().add_child(menu)

	# Ajusta número e inicia jogo
	menu.get_node("Button_plus_player").emit_signal("pressed")
	menu.get_node("Button_start_game").emit_signal("pressed")
	await get_tree().process_frame
	var jogo = get_tree().current_scene
	assert_eq(jogo.get("player_number"), 3)

	# Retorna ao menu inicial
	var back_btn = jogo.get_node("Button_back_menu") as Button
	back_btn.emit_signal("pressed")
	await get_tree().process_frame
	assert_true(get_tree().current_scene.filename.ends_with("tela_inicial.tscn"))
