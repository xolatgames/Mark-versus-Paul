extends CharacterBody2D


var speed = Vector2.ZERO


func _physics_process(delta):
	velocity = speed
	
	move_and_slide()
