extends CanvasLayer

class_name AirIndicator

@export var max_air = 120.0
@export var damaging = 10


func _ready():
	GameStats.air_left = max_air


func _process(delta):
	$Bar.value = GameStats.air_left as float / max_air as float
	
	if GameStats.air_left > max_air:
		GameStats.air_left = max_air


func _on_timer_timeout():
	if GameStats.air_left > 0:
		GameStats.air_left -= 1
	else:
		GameStats.takeDamage(damaging)
