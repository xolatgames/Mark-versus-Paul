extends Control


func _process(delta):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), $"Options/Sound Set".value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), $"Options/Music Set".value)


func _on_start_the_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")


func _on_options_pressed():
	$Options.show()


func _on_developers_pressed():
	$Developers.show()


func _on_quit_pressed():
	get_tree().quit()


func _on_git_hub_pressed():
	OS.shell_open("https://github.com/xolatgames/Mark-versus-Paul")


func _on_blogger_pressed():
	OS.shell_open("https://xolatgames.blogspot.com/")


func _on_close_options_pressed():
	$Options.hide()


func _on_close_developers_pressed():
	$Developers.hide()


func link(link):
	OS.shell_open(link)
