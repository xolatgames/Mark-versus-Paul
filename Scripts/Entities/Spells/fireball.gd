extends Area2D


var speed = 8


func _physics_process(delta):
	translate(transform.basis_xform(Vector2(speed, 0)))
