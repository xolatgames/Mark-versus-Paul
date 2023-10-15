extends Node2D


func _on_trigger_body_entered(body, trig):
	if body is Mark:
		callTheTrigger(trig)


func callTheTrigger(trig):
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
			GameStats.showDialog("Mark", load("res://Sprites/Dancing/Characters/Mark/Dancing.svg"), "What is it into?")
			$Timer.start()
			await  $Timer.timeout
			GameStats.showDialog("Paul", load("res://Sprites/NPC/Paul/Paul.svg"), "I don't tell you!")
			$Timer.start()
			await  $Timer.timeout
			$Paul.speed = Vector2(300, 0)
			$"Trigger #2".queue_free()
		3:
			GameStats.showDialog("Mark", load("res://Sprites/Dancing/Characters/Mark/Dancing.svg"), "Orc, pls, pass me!")
			$Timer.start()
			await  $Timer.timeout
			GameStats.showDialog("Orc", load("res://Sprites/Dancing/Characters/Orc/Idle.svg"), "Only if you have dancing with me!")
			$Timer.start()
			await  $Timer.timeout
			GameStats.showDialog("Mark", load("res://Sprites/Dancing/Characters/Mark/Dancing.svg"), "Okay")
		4:
			$AnimationPlayer.play("Over")
		5:
			GameStats.showDialog("Orc", load("res://Sprites/Dancing/Characters/Orc/Idle.svg"), "You're the loser! Let's try it again!")
			$Timer.start()
			await  $Timer.timeout
			get_tree().change_scene_to_file("res://Scenes/dancing.tscn")
		6:
			GameStats.scene = "res://Scenes/volcano.tscn"
			GameStats.saveGame()
			await get_tree().process_frame
			get_tree().change_scene_to_file("res://Scenes/volcano.tscn")
