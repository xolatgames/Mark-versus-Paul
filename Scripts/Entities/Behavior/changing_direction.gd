extends Flipping

class_name ChangingDirection

var direction = 0


func changeDirection():
	randomize()
	direction = randi()%360
