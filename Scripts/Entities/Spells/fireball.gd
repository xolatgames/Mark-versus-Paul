extends Area2D

class_name Fireball

var damage = 5
var speed = 8


func _physics_process(delta):
	translate(transform.basis_xform(Vector2(speed, 0)))


func _on_body_entered(body):
	if body is Enemy:
		body.damaging(damage)
	
	if !body is Mark:
		queue_free()
