extends Area2D

class_name Teleport


func _on_body_entered(body):
	if body is Mark:
		body.global_position = $"Teleport position".global_position
