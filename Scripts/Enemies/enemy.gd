extends Flipping

class_name Enemy

@export var health = 50
@export var speed = 100
@export var damage_radius = 32
@export var damage = 10
var neutralize = false


func pushing():
	$"Pushing sound".play()
	health -= 50 * (GameStats.level / 5 + 1)


func damaging(taking_damage):
	$Damaged.play()
	health -= taking_damage * (GameStats.level / 5 + 1)
