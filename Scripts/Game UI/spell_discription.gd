extends CanvasLayer

class_name SpellDescription


func _on_close_pressed():
	hide()


func _on_visibility_changed():
	if get_tree():
		if visible:
			get_tree().paused = true
		else:
			get_tree().paused = false
