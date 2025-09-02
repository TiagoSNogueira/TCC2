extends Control

func _ready():
	$CenterContainer/VBoxContainer/jogo1.connect("pressed", Callable(self, "_on_jogo1_pressed"))
	$CenterContainer/VBoxContainer/jogo2.connect("pressed", Callable(self, "_on_jogo2_pressed"))
	$CenterContainer/VBoxContainer/jogo3.connect("pressed", Callable(self, "_on_jogo3_pressed"))

func _on_jogo1_pressed():
	_abrir_jogo("res://jogos/jogo1/Fazenda.exe")

func _on_jogo2_pressed():
	_abrir_jogo("res://jogos/jogo2/jogo2.exe")

func _on_jogo3_pressed():
	_abrir_jogo("res://jogos/jogo3/jogo3.exe")

func _abrir_jogo(relative_path: String):
	var exe_path = ProjectSettings.globalize_path(relative_path)
	var error_code = OS.execute(exe_path, PackedStringArray(), [], false)
	if error_code != 0:
		push_error("Erro ao abrir o jogo: " + exe_path + " (código: " + str(error_code) + ")")
