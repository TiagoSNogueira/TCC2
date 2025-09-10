extends Control

# O caminho para os jogos
const JOGO1_PATH = "res://jogos/jogo1/Fazenda.exe"
const JOGO2_PATH = "res://jogos/jogo2/Explorador Aprendiz.exe"
const JOGO3_PATH = "res://jogos/jogo3/jogo3.exe"
const JOGO4_PATH = "res://jogos/jogo4/jogo4.exe"

func _ready():
	# Conecta o sinal de 'input_event' de cada Area2D
	$Portal1.connect("input_event", Callable(self, "_on_portal_input_event").bind(JOGO1_PATH))
	$Portal2.connect("input_event", Callable(self, "_on_portal_input_event").bind(JOGO2_PATH))
	$Portal3.connect("input_event", Callable(self, "_on_portal_input_event").bind(JOGO3_PATH))
	$Portal4.connect("input_event", Callable(self, "_on_portal_input_event").bind(JOGO4_PATH))

# Esta função lida com o evento de entrada para todos os portais
func _on_portal_input_event(viewport, event, shape_idx, game_path):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_abrir_jogo(game_path)

func _abrir_jogo(relative_path: String):
	var exe_path = ProjectSettings.globalize_path(relative_path)
	var error_code = OS.execute(exe_path, PackedStringArray(), [], false)
	if error_code != 0:
		push_error("Erro ao abrir o jogo: " + exe_path + " (código: " + str(error_code) + ")")
		
#
##extends Control

##func _ready():

##$CenterContainer/VBoxContainer/jogo1.connect("pressed", Callable(self, "_on_jogo1_pressed"))

#$CenterContainer/VBoxContainer/jogo2.connect("pressed", Callable(self, "_on_jogo2_pressed"))

#$CenterContainer/VBoxContainer/jogo3.connect("pressed", Callable(self, "_on_jogo3_pressed"))
#func _on_jogo1_pressed():

#_abrir_jogo("res://jogos/jogo1/Fazenda.exe")



#func _on_jogo2_pressed():

#_abrir_jogo("res://jogos/jogo2/Explorador Aprendiz.exe")



#func _on_jogo3_pressed():

#_abrir_jogo("res://jogos/jogo3/jogo3.exe")



#func _abrir_jogo(relative_path: String):

#var exe_path = ProjectSettings.globalize_path(relative_path)

#var error_code = OS.execute(exe_path, PackedStringArray(), [], false)

#if error_code != 0:

#push_error("Erro ao abrir o jogo: " + exe_path + " (código: " + str(error_code) + ")")
