extends Area2D


@export var scene = ""


func _on_body_entered(body):
	if body is Mark:
		if !scene == "":
			get_tree().change_scene_to_file("res://Scenes/"+scene+".tscn")
		else:
			get_tree().quit()
