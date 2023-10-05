extends Area2D

class_name DefeatAllOfTheEnemies

var activated = false


func _process(delta):
	checkEnemies()


func checkEnemies():
	var bodies = get_overlapping_bodies()
	
	for i in bodies:
		if i is Enemy:
			if !i.neutralize:
				return
	
	if !activated:
		var teleport = load("res://Entities/teleport.tscn")
		teleport = teleport.instantiate()
		teleport.global_position = $Teleport.position
		teleport.name = "Teleport" + str(get_index())
		add_child(teleport)
		
		var teleport_position = Marker2D.new()
		teleport_position.global_position = $"Teleport/Teleport position".position
		teleport_position.name = "Teleport position"
		get_node("Teleport" + str(get_index())).add_child(teleport_position)
		
		$Teleport/Activating.play()
		
		activated = true
