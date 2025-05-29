extends Resource
class_name Rota

enum Cor {Qualquer, Rosa, Branca, Azul, Amarela, Laranja, Preta, Vermelha, Verde}

@export var cidade1: String
@export var cidade2: String
@export var tamanho: int
@export var cor: Cor
@export var pontos: int
@export var dono: int

func _init(p_cidade1 = "", p_cidade2 = "", p_tamanho = 1, p_cor = Cor.Qualquer, p_pontos = 1):
	cidade1 = p_cidade1
	cidade2 = p_cidade2
	tamanho = p_tamanho
	cor = p_cor
	pontos = p_pontos
	dono = 0
