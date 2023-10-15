extends Area2D


func _on_body_entered(body):
	if body is Mark:
		body.get_node("Drinking").play()
		
		queue_free()
