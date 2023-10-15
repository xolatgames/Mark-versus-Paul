extends Timer

class_name DamagingLevel

@export var damage = 1


func _on_timeout():
	GameStats.takeDamage(damage)
