extends Flipping

class_name Running

var speed = Vector2.ZERO


func _physics_process(delta):
	velocity = speed
	
	flipping()
	
	move_and_slide()
