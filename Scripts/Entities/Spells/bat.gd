extends CharacterBody2D

class_name Bat

var speed = 100
var direction = 0


func _ready():
	changeDirection()


func _physics_process(delta):
	velocity = Vector2.from_angle(direction) * speed
	
	move_and_slide()


func _on_change_direction_timeout():
	changeDirection()


func changeDirection():
	randomize()
	direction = randi()%360
