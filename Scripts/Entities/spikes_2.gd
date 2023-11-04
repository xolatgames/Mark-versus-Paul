extends Area2D


@export var speed = Vector2.ZERO


func _physics_process(delta):
	translate(speed)


func _on_body_entered(body):
	if body is Mark:
		GameStats.takeDamage(50)
	speed = -speed
