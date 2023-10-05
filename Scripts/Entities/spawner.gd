extends Marker2D

class_name Spawner

@export var spawn_object = ""
@export var timer = 5


func _ready():
	$Timer.start(timer - 1 + randf() * 2)


func _on_timer_timeout():
	var obj = load("res://Entities/"+spawn_object+".tscn")
	obj = obj.instantiate()
	obj.position = position
	obj.moved = true
	get_tree().current_scene.add_child(obj)
	
	$Timer.start(timer - 1 + randf() * 2)
