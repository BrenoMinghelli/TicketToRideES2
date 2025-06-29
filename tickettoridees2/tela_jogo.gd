extends Node2D


var player_number = 0
var rotas: Array[Rota]
var rota_selecionada: int = -1
var destinos_em_oferta: Array[CartaDestino] = []
var bilhetes_jogador: Array[CartaDestino] = [] 
var baralho_destinos: BaralhoDestinos = BaralhoDestinos.new()

# variáveis dos outros nodes para as funções funcionarem adequadamente
@onready var baralho = $Baralho
@onready var tabuleiro = $Tabuleiro
@onready var j1 = $Jogador
@onready var botao_comprar = $Button_comprar
@onready var botao_comprar_destinos = $Button_comprar_bilhetes

@onready var botao_comprar_destino1= $Button_comprar_bilhetes_destino1
@onready var botao_comprar_destino2 = $Button_comprar_bilhetes_destino2
@onready var botao_comprar_destino3= $Button_comprar_bilhetes_destino3

@onready var scroll_bilhetes  = $Scroll_bilhetes_destino
@onready var label_bilhetes   = $Scroll_bilhetes_destino/Label_bilhetes_jogador

@onready var botao_comprar_topo = $Button_comprar_topo
@onready var botao_comprar_pos_1 = $Button_comprar_pos1
@onready var botao_comprar_pos_2 = $Button_comprar_pos2
@onready var botao_comprar_pos_3 = $Button_comprar_pos3
@onready var botao_comprar_pos_4 = $Button_comprar_pos4
@onready var botao_comprar_pos_5 = $Button_comprar_pos5
@onready var botao_conquistar = $Button_conq_rota

@onready var label_mao = $Scroll_mao/Label_mao_jogador

@onready var routes_container = $routes_container
@onready var label_pontuacao = $Label_pontuacao

const COR_HEX := {
	Rota.Cor.Rosa:    "#FF69B4",
	Rota.Cor.Branca:  "#FFFFFF",
	Rota.Cor.Azul:    "#1E90FF",
	Rota.Cor.Amarela: "#FFD700",
	Rota.Cor.Laranja: "#FFA500",
	Rota.Cor.Preta:   "#000000",
	Rota.Cor.Vermelha:"#FF0000",
	Rota.Cor.Verde:   "#32CD32"
}

func hide_button_action():
	botao_comprar.visible = false
	botao_conquistar.visible = false
	botao_comprar_destinos.visible = false


func hide_button_compra():
	botao_comprar_topo.visible = false
	botao_comprar_pos_1.visible = false
	botao_comprar_pos_2.visible = false
	botao_comprar_pos_3.visible = false
	botao_comprar_pos_4.visible = false
	botao_comprar_pos_5.visible = false


func hide_button_destino():
	botao_comprar_destino1.visible = false
	botao_comprar_destino2.visible = false
	botao_comprar_destino3.visible = false

func appear_button_action():
	botao_comprar.visible = true
	botao_conquistar.visible = true
	botao_comprar_destinos.visible = true

func appear_button_compra():
	botao_comprar_topo.visible = true
	botao_comprar_pos_1.visible = true
	botao_comprar_pos_2.visible = true
	botao_comprar_pos_3.visible = true
	botao_comprar_pos_4.visible = true
	botao_comprar_pos_5.visible = true
	
	
func appear_button_compra_destinos():
	botao_comprar_destino1.visible = true
	botao_comprar_destino2.visible = true
	botao_comprar_destino3.visible = true


func comprar_p1(pos: int):
	j1.comprar_carta_p1(pos, baralho)
	j1.imprimir_mao()
	label_mao.text = j1.atualizar_ui_mao()
	
func iniciar_compra_destinos():                # <-- NOVO
	# compra 3 cartas do baralho de destinos
	destinos_em_oferta = baralho_destinos.comprar_varias(3)

	# escreve o texto em cada botão
	for i in range(destinos_em_oferta.size()):
		var c := destinos_em_oferta[i]
		var txt := "%s – %s (%d pts)" % [c.cidade1, c.cidade2, c.pontos]
		match i:
			0: botao_comprar_destino1.text = txt
			1: botao_comprar_destino2.text = txt
			2: botao_comprar_destino3.text = txt

	hide_button_action()            # some o menu
	hide_button_compra()            # se algum botão de carta ainda estiver visível
	appear_button_compra_destinos() # mostra os 3 destinos

func escolher_destino(indice: int):
	if indice >= destinos_em_oferta.size():
		return
	
	var carta := destinos_em_oferta[indice]
	print("Bilhete-destino escolhido: %s – %s (%d pts)"
		  % [carta.cidade1, carta.cidade2, carta.pontos])
	
	_registrar_bilhete_destino(carta)     

	hide_button_destino()
	appear_button_action()               
	
	
func _registrar_bilhete_destino(carta: CartaDestino) -> void:
	bilhetes_jogador.append(carta)
	
	var linha := "- %s – %s (%d pts)" % [carta.cidade1, carta.cidade2, carta.pontos]
	
	# Acumula linhas na mesma Label 
	if label_bilhetes.text == "":
		label_bilhetes.text = linha
	else:
		label_bilhetes.text += "\n" + linha
	
	# Garante que o scroll desça até a última linha
	scroll_bilhetes.scroll_vertical = scroll_bilhetes.get_v_scroll_bar().max_value

func _on_pontuacao_alterada(nova_pontuacao: int) -> void:
	label_pontuacao.text = "Pontuação: %d" % nova_pontuacao

func cor_para_color(cor_enum: int) -> Color:
	var hex_str = COR_HEX.get(cor_enum, "#808080") # default cinza se não existir
	return Color(hex_str)

func _on_botao_conquistar_pressed(idx: int) -> void:
	rota_selecionada = idx
	if rota_selecionada < 0 or rota_selecionada >= rotas.size():
		print("Nenhuma rota selecionada para conquistar!")
		return
	var rota = rotas[rota_selecionada]

	if rota.conquistada:
		print("A rota já foi conquistada por outro jogador!")
		return

	var cor_da_rota = rota.cor
	# print(rota.Cor)
	var custo = rota.tamanho
	var contagem = j1.contar_para_rota(cor_da_rota)

	if contagem["cor"] + contagem["coringa"] < custo:
		print("Você não tem cartas suficientes para conquistar esta rota!")
		return

	var pagou = j1.gastar_cartas_para_rota(cor_da_rota, custo)
	if not pagou:
		print("Erro ao descartar cartas!")
		return

	rota.conquistar(j1.id)

	j1.adicionar_pontos(rota.pontos)
	print("Rota conquistada! Você ganhou %d pontos." % rota.pontos)

	label_mao.text = j1.atualizar_ui_mao()

	rota_selecionada = -1
	
	j1.imprimir_mao() 
	appear_button_action()
	for child in routes_container.get_children():
		routes_container.remove_child(child)
		child.queue_free()
	routes_container.hide()

	
func _on_opcao_rota_pressed(idx: int) -> void:
	#routes_container.hide()
	_on_botao_conquistar_pressed(idx)

func _preencher_popup_rotas() -> void:
	for child in routes_container.get_children():
		routes_container.remove_child(child)
		child.queue_free()
	print(routes_container.get_child_count())
	for i in rotas.size():
		var rota = rotas[i]
		if not rota.conquistada:
			var cor_da_rota = rota.cor
			var custo = rota.tamanho
			var contagem = j1.contar_para_rota(cor_da_rota)
			print(contagem)
			if contagem["cor"] + contagem["coringa"] >= custo:
				var btn = Button.new()
				btn.text = "%d: %s ↔ %s (custo %d)" % [
					i + 1, rota.cidade1, rota.cidade2, rota.tamanho
				]
				var c: Color = cor_para_color(rota.cor)
				btn.add_theme_color_override("font_color", c)
				btn.add_theme_color_override("font_color_hover", c.lightened(0.2))
				btn.add_theme_color_override("font_color_pressed", c.darkened(0.2))
				var handler := Callable(self, "_on_opcao_rota_pressed").bind(i)
				btn.pressed.connect(handler)
				routes_container.add_child(btn)
				routes_container.show()
	if routes_container.get_child_count() > 0:
		print(routes_container.get_child_count())
		hide_button_action()

	
func _ready():
	hide_button_compra()
	print(player_number)
	baralho.imprimir_baralho()
	
	hide_button_destino()
	add_child(baralho_destinos)
	baralho_destinos.inicializar_baralho()
	baralho_destinos.embaralhar()
	baralho_destinos.imprimir_baralho()
	
	
	for i in range(5):
		comprar_p1(5)

	rotas = tabuleiro.init_rotas()

	for i in range(rotas.size()):
		var ro = rotas[i]
		print("Rota: %d - %s - %s, Tamanho = %d, Cor = %s"
			% [i+1, ro.cidade1, ro.cidade2, ro.tamanho, Rota.Cor.keys()[ro.cor]])
			
	label_pontuacao.text = "Pontuação: %d" % j1.pontuacao
	label_pontuacao.position = Vector2(1026, 600)
	j1.connect("pontuacao_alterada", Callable(self, "_on_pontuacao_alterada"))
	#se quiser testar em alguma rota basta mudar aqui.
	rota_selecionada = -1
	botao_conquistar.pressed.connect(_preencher_popup_rotas)
