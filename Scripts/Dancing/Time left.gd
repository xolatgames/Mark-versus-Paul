extends CanvasLayer

class_name TimeLeft

signal over_dancing

var time_left = 0.0
@export var max_time = 60.0
var over = false


func _process(delta):
	$Bar.value = time_left as float / max_time as float
	
	if !over:
		if time_left >= max_time:
			emit_signal("over_dancing")
			over = true


func _on_timer_timeout():
	time_left += 1
