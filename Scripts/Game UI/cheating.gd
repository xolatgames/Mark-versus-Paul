extends Spellbook

class_name Cheating


var console = false


func cheating():
	if Input.is_action_just_pressed("cheat console"):
		if !console:
			console = true
		else:
			console = false
	
	if console:
		$"Cheat Console".show()
	else:
		$"Cheat Console".hide()


func cheatActivate(cheat):
	match cheat:
		"spells":
			GameStats.spells()
			print("cheat activated!")
	
	$"Cheat Console/Enter the Code".text = ""
	console = false
