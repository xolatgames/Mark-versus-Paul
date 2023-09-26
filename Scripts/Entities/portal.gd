extends Area2D


@export var scene = ""


func _on_body_entered(body):
	if body is Mark:
		get_tree().change_scene_to_file("res://Scenes/"+scene+".tscn")
