extends Control

class_name MainMenu


func _ready():
	$"Options/Close".connect("pressed", Callable(self, "closeOptions"))
	$"Options/Sound Set".value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound"))
	$"Options/Music Set".value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))


func _process(delta):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), $"Options/Sound Set".value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), $"Options/Music Set".value)


func _on_start_the_game_pressed():
	GameStats.newGame()
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_continue_pressed():
	if FileAccess.file_exists("user://game.ini"):
		GameStats.loadGame() 
		get_tree().change_scene_to_file(GameStats.scene)


func _on_options_pressed():
	$Options.show()


func _on_developers_pressed():
	$Developers.show()


func _on_quit_pressed():
	get_tree().quit()


func closeOptions():
	$Options.hide()


func _on_close_developers_pressed():
	$Developers.hide()


func link(link):
	OS.shell_open(link)


func _on_languages_pressed():
	$"Languages panel".show()


func changeLanguage(language):
	TranslationServer.set_locale(language)
	get_tree().reload_current_scene()


func _on_close_pressed():
	$"Languages panel".hide()
