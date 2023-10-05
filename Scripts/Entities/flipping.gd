extends CharacterBody2D

class_name Flipping


var flip = ""


func flipping():
	if velocity.x < 0:
		flip = "left"
	elif velocity.x > 0:
		flip = "right"
	
	match flip:
		"right":
			rotation_degrees = 0
			scale.y = 1
		"left":
			rotation_degrees = 180
			scale.y = -1
