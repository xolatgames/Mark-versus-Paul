extends Node2D

class_name BottleRaandomizer


func _process(delta):
	var bottles = get_tree().get_nodes_in_group("bottle_with_air")
	var bottles_positions = get_children()
	
	randomize()
	
	if bottles.size() == 0:
		var bottle = load("res://Entities/bottle_with_air.tscn")
		bottle = bottle.instantiate()
		bottle.position = bottles_positions[randi_range(0, bottles_positions.size())].global_position
		get_tree().current_scene.add_child(bottle)
