extends Resource
class_name CartaDestino

@export var cidade1: String
@export var cidade2: String
@export var pontos: int

# Estado interno usado durante a partida
var cumprida: bool = false

func _init(p_cidade1 := "", p_cidade2 := "", p_pontos := 0):
	cidade1 = p_cidade1
	cidade2 = p_cidade2
	pontos  = p_pontos 
