extends Area2D


@export var scene = ""
var activated = false


func _process(delta):
	if GameStats.milk_count == 0:
		$AnimatedSprite2D.play("Activate")
		activated = true
	else:
		$AnimatedSprite2D.play("Deactivate")
		activated = false

func _on_body_entered(body):
	if body is Mark:
		if activated:
			if !scene == "":
				GameStats.scene = "res://Scenes/"+scene+".tscn"
				
				get_tree().change_scene_to_file("res://Scenes/"+scene+".tscn")
			else:
				get_tree().quit()
