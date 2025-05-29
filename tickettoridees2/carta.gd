extends Resource
class_name Carta

#define uma carta

enum Cor {Rosa, Branca, Azul, Amarela, Laranja, Preta, Vermelha, Verde, Coringa}

@export var cor: Cor = Cor.Rosa
@export var textura: Texture2D

#get necessario para atualizar os botoes e a ui da mao do jogador
func get_cor():
	if cor == Cor.Coringa:
		return "Coringa"
	
	var nome_cor = Cor.keys()[cor] if cor < Cor.size() else "Desconhecida"
	return "%s" % [nome_cor.capitalize()]

func _init(p_cor: Cor = Cor.Rosa, p_textura: Texture2D = null):
	cor = p_cor
	textura = p_textura
