extends Control

class_name TheEnd


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
