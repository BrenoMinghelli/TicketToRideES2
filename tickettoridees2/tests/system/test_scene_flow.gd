extends "res://addons/gut/test.gd"

func test_start_game_scene_changes_and_passes_player_number() -> void:
	var main = preload("res://tela_jogadores.tscn").instantiate()
	get_tree().get_root().add_child(main)
	main.player_number = 4
	var start_btn = main.get_node("Button_start_game") as Button
	start_btn.emit_signal("pressed")
	await get_tree().process_frame
	var current = get_tree().current_scene
	assert_true(current.filename.ends_with("tela_jogo.tscn"))
	assert_eq(current.get("player_number"), 4)
