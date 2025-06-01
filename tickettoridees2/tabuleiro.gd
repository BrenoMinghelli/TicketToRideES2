extends Sprite2D

@onready var rotas: Array[Rota]


#criador das rotas da partida
func init_rotas():
	var rota1 = Rota.new("Ijuí","Maringá",2,Rota.Cor.Azul,2)
	var rota2 = Rota.new("Ijuí","Alvorada",1,Rota.Cor.Laranja,1)
	rotas.append(rota1)
	rotas.append(rota2)
	
	
	
	return rotas
