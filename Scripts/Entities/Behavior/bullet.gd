extends Area2D

class_name Bullet

var damage = 5
var speed = 8
var is_this_fron_enemy = false


func _physics_process(delta):
	translate(transform.basis_xform(Vector2(speed, 0)))


func _on_body_entered(body):
	if is_this_fron_enemy:
		if body is Mark:
			if !body.shield_is_activated:
				GameStats.takeDamage(damage)
			queue_free()
		
		if body is Bat:
			body.takeDamage(damage)
			queue_free()
		
		if !body is Enemy and !body is Paul:
			queue_free()
		
	else:
		if body is Enemy:
			body.damaging(damage)
		
		if body is Paul:
			body.takeDamage(damage)
		
		if !body is Mark:
			queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
