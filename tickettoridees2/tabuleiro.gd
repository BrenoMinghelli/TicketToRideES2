extends Sprite2D

@onready var rotas: Array[Rota]


#criador das rotas da partida
func init_rotas():
	var rota1 = Rota.new("Ijuí","Maringá",2,Rota.Cor.Azul,2)
	var rota2 = Rota.new("Ijuí","Alvorada",1,Rota.Cor.Laranja,1)
	rotas.append(rota1)
	rotas.append(rota2)
	rotas.append(Rota.new("Tabatinga", "Porto Velho", 4, Rota.Cor.Verde, 7))
	rotas.append(Rota.new("Porto Velho", "Manaus", 3, Rota.Cor.Amarela, 4))
	rotas.append(Rota.new("Porto Velho", "Vilhena", 2, Rota.Cor.Rosa, 2))
	rotas.append(Rota.new("Manaus", "Alenquer", 3, Rota.Cor.Azul, 4))
	rotas.append(Rota.new("Alenquer", "Belém", 3, Rota.Cor.Verde, 4))
	rotas.append(Rota.new("Manaus", "Boa Vista", 2, Rota.Cor.Branca, 2))
	rotas.append(Rota.new("Vilhena", "Cuiabá", 2, Rota.Cor.Preta, 2))
	rotas.append(Rota.new("Cuiabá", "Brasília", 4, Rota.Cor.Vermelha, 7))
	rotas.append(Rota.new("Cuiabá", "Aquidauana", 3, Rota.Cor.Laranja, 4))
	rotas.append(Rota.new("Aquidauana", "Maringá", 4, Rota.Cor.Azul, 7))
	rotas.append(Rota.new("Maringá", "São José do Rio Preto", 2, Rota.Cor.Branca, 2))
	rotas.append(Rota.new("Maringá", "Curitiba", 3, Rota.Cor.Preta, 4))
	rotas.append(Rota.new("Curitiba", "São Paulo", 3, Rota.Cor.Verde, 4))
	rotas.append(Rota.new("São José do Rio Preto", "São Paulo", 4, Rota.Cor.Vermelha, 7))
	rotas.append(Rota.new("São José do Rio Preto", "Bom Jesus da Lapa", 4, Rota.Cor.Amarela, 7))
	rotas.append(Rota.new("São Paulo", "Belo Horizonte", 3, Rota.Cor.Laranja, 4))
	rotas.append(Rota.new("Belo Horizonte", "Niterói", 1, Rota.Cor.Rosa, 1))
	rotas.append(Rota.new("Niterói", "Nova Viçosa", 4, Rota.Cor.Qualquer, 7))
	rotas.append(Rota.new("Nova Viçosa", "Salvador", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Salvador", "Maceió", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Maceió", "Natal", 4, Rota.Cor.Qualquer, 7))
	rotas.append(Rota.new("Natal", "Fortaleza", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Fortaleza", "Crato", 1, Rota.Cor.Qualquer, 1))
	rotas.append(Rota.new("Crato", "Teresina", 4, Rota.Cor.Qualquer, 7))
	rotas.append(Rota.new("Teresina", "Imperatriz", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Imperatriz", "Belém", 4, Rota.Cor.Qualquer, 7))
	rotas.append(Rota.new("Bom Jesus da Lapa", "Salvador", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Porto Velho", "Rio Branco", 3, Rota.Cor.Qualquer, 4))
	rotas.append(Rota.new("Boa Vista", "Cuiabá", 6, Rota.Cor.Qualquer, 15))
	return rotas
