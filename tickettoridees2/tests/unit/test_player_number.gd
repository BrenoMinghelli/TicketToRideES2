extends "res://addons/gut/test.gd"

const PlayerConfig = preload("res://tela_jogadores.gd")

func test_initial_player_number() -> void:
	var cfg = PlayerConfig.new()
	assert_eq(cfg.player_number, 2)

func test_add_pn_within_limits() -> void:
	var cfg = PlayerConfig.new()
	cfg.player_number = 2
	cfg.add_pn()
	assert_eq(cfg.player_number, 3)

func test_add_pn_at_max_limit() -> void:
	var cfg = PlayerConfig.new()
	cfg.player_number = 5
	cfg.add_pn()
	assert_eq(cfg.player_number, 5)

func test_sub_pn_within_limits() -> void:
	var cfg = PlayerConfig.new()
	cfg.player_number = 3
	cfg.sub_pn()
	assert_eq(cfg.player_number, 2)

func test_sub_pn_at_min_limit() -> void:
	var cfg = PlayerConfig.new()
	cfg.player_number = 2
	cfg.sub_pn()
	assert_eq(cfg.player_number, 2)
