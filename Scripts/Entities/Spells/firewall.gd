extends Area2D

class_name Firewall

var damage = 10


func _on_body_entered(body):
	if body is Enemy:
		body.damaging(damage)
	
	if body is Paul:
		body.takeDamage(damage)
