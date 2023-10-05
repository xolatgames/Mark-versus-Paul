extends Flipping

class_name Bat

var speed = 100
var direction = 0
var health = 20


func _ready():
	changeDirection()


func _process(delta):
	if health <= 0:
		queue_free()


func _physics_process(delta):
	velocity = Vector2.from_angle(direction) * speed
	
	flipping()
	
	move_and_slide()


func takeDamage(damage):
	health -= damage


func _on_change_direction_timeout():
	changeDirection()


func changeDirection():
	randomize()
	direction = randi()%360
