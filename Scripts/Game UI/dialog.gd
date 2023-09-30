extends CanvasLayer


func _process(delta):
	if Input.is_action_just_pressed("somersaults"):
		hide()


func _on_visibility_changed():
	if get_tree():
		if visible:
			get_tree().paused = true
		else:
			get_tree().paused = false


func _on_tree_exiting():
	get_tree().paused = false
