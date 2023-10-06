extends Area2D

class_name BottleWithAir


func _on_body_entered(body):
	if body is Mark:
		GameStats.air_left += 120
		
		queue_free()
