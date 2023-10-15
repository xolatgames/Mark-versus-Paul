extends CanvasLayer

class_name GameMenu


func _ready():
	$"Options/Close".connect("pressed", Callable(self, "closeOptions"))
	$"Options/Sound Set".value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound"))
	$"Options/Music Set".value = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))


func _process(delta):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), $"Options/Sound Set".value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), $"Options/Music Set".value)
	
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func closeOptions():
	$Options.hide()


func _on_continue_pressed():
	hide()


func _on_restart_the_level_pressed():
	GameStats.restartLevel()


func _on_options_pressed():
	$Options.show()


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_visibility_changed():
	if get_tree():
		if visible:
			get_tree().paused = true
		else:
			get_tree().paused = false


func _on_tree_exiting():
	get_tree().paused = false
