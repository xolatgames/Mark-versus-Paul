extends Marker2D

class_name Spawner

@export var spawn_object = ""
@export var timer = 5
@export var only_if_it_visible = false


func _ready():
	$Timer.start(timer - 1 + randf() * 2)


func spawnTheEnemy(spawn_on_visible):
	var obj = load("res://Entities/"+spawn_object+".tscn")
	obj = obj.instantiate()
	obj.position = position
	if !spawn_on_visible:
		obj.moved = true
	get_tree().current_scene.add_child(obj)


func _on_timer_timeout():
	if only_if_it_visible:
		if $VisibleOnScreenNotifier2D.is_on_screen():
			spawnTheEnemy(true)
	else:
		spawnTheEnemy(false)
	
	$Timer.start(timer - 1 + randf() * 2)
