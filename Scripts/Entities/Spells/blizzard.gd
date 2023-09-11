extends Area2D

class_name Blizzard

var damage = 3


func _on_body_entered(body):
	if body is Enemy:
		body.damaging(damage)
