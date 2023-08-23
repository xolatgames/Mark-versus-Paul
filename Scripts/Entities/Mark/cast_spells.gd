extends CharacterBody2D

class_name CastSpells


var shield_is_activated = false
var spelling = false


func castingSpells():
	if shield_is_activated:
		$Shield.visible = true
	else:
		$Shield.visible = false
	
	if Input.is_action_pressed("shield"):
		if !GameStats.already_spelling:
			shield_is_activated = true
			GameStats.already_spelling = true
	else:
		if shield_is_activated:
			shield_is_activated = false
			GameStats.already_spelling = false
