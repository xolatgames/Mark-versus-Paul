extends Area2D

class_name Avalance

var speed = 1


func _physics_process(delta):
	translate(Vector2(speed, 0))


func _on_body_entered(body):
	if body is Mark:
		speed = 0
		GameStats.stuck()
