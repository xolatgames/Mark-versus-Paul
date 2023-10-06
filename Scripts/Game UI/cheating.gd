extends CanvasLayer

class_name Cheating


func _process(delta):
	if Input.is_action_just_pressed("cheat console"):
		hide()
	
	if Input.is_action_just_pressed("ui_cancel"):
		hide()


func _on_enter_the_code_text_submitted(cheat):
	match cheat:
		"spells":
			GameStats.spells()
			print("cheat activated!")
		"undead":
			GameStats.undead = true
			print("cheat activated!")
		"mortal":
			GameStats.undead = false
			print("cheat activated!")
		"drinking":
			var milks = get_tree().get_nodes_in_group("milk")
			for i in milks:
				i.queue_free()
		"next level":
			print("cheat activated!")
			GameStats.nextLevel()
	
	$"Enter the Code".text = ""
	hide()


func _on_visibility_changed():
	if get_tree():
		if visible:
			get_tree().paused = true
		else:
			get_tree().paused = false


func _on_tree_exiting():
	get_tree().paused = false
