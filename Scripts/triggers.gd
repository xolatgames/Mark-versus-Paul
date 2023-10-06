extends Node2D


func _on_trigger_body_entered(body, trig):
	if body is Mark:
		match trig:
			1:
				GameStats.showDialog("Peter", load("res://Sprites/NPC/Peter/Peter.svg"), "How the weather like today? RCHS tell me, that today we have a hot!")
				$"Trigger #1".queue_free()
			2:
				$Music.stop()
				$Music2.play()
				GameStats.showDialog("Paul", load("res://Sprites/NPC/Paul/Paul.svg"), "I have your package! But I don't give you it!")
				$Timer.start()
				await  $Timer.timeout
				GameStats.showDialog("Mark", load("res://Sprites/Mark/Body/Idle.svg"), "What is it into?")
				$Timer.start()
				await  $Timer.timeout
				GameStats.showDialog("Paul", load("res://Sprites/NPC/Paul/Paul.svg"), "I don't tell you!")
				$Timer.start()
				await  $Timer.timeout
				$Paul.speed = Vector2(300, 0)
				$"Trigger #2".queue_free()
