extends Sprite2D

@onready var rotas: Array[Rota]


#criador das rotas da partida
func init_rotas():
	var rota1 = Rota.new("Ijuí","Maringá",2,Rota.Cor.Azul,2)
	var rota2 = Rota.new("Ijuí","Alvorada",1,Rota.Cor.Laranja,1)
	rotas.append(rota1)
	rotas.append(rota2)
	rotas.append(Rota.new("Fortaleza", "Natal", 5, Rota.Cor.Amarela, 5))
	rotas.append(Rota.new("Nova Viçosa", "Niterói", 5, Rota.Cor.Verde, 5))
	rotas.append(Rota.new("Niterói", "Belo Horizonte", 4, Rota.Cor.Rosa, 4))
	rotas.append(Rota.new("Belo Horizonte", "Brasília", 6, Rota.Cor.Branca, 6))
	rotas.append(Rota.new("Brasília", "Cuiabá", 4, Rota.Cor.Azul, 4))
	rotas.append(Rota.new("Porto Velho", "Manaus", 6, Rota.Cor.Verde, 6))
	rotas.append(Rota.new("Maringá", "Curitiba", 3, Rota.Cor.Rosa, 3))
	rotas.append(Rota.new("Curitiba", "São Paulo", 4, Rota.Cor.Branca, 4))
	rotas.append(Rota.new("São Paulo", "São José do Rio Preto", 5, Rota.Cor.Azul, 5))
	return rotas
