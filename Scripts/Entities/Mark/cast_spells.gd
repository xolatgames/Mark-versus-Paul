extends CharacterBody2D

class_name CastSpells

var shield_is_activated = false
var spelling = false
var spells_distance = 256
var mana_restore_speed = 20


func castingSpells():
	if shield_is_activated:
		$Shield.show()
	else:
		$Shield.hide()
	
	if GameStats.opened_spells.has("shield") and Input.is_action_pressed("shield") and !GameStats.already_spelling:
		if !$"Shield sound".playing:
			$"Shield sound".play()
		shield_is_activated = true
		takeABreath(0.1)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !GameStats.already_spelling:
			match GameStats.choosed_spell:
				2:
					spawnTheFireball()
					takeABreath(0.2)
				3:
					if GameStats.mana > 3:
						if !$"Healing sound".playing:
							$"Healing sound".play()
						$Healing.emitting = true
						GameStats.health += 1
						GameStats.mana -= 2
						takeABreath(0.1)
				4:
					if GameStats.mana > 21:
						if !global_position.distance_to(get_viewport().get_camera_2d().get_global_mouse_position()) > spells_distance:
							showTeleport()
							global_position = get_viewport().get_camera_2d().get_global_mouse_position()
							showTeleport()
							GameStats.mana -= 20
							takeABreath(1)
				5:
					if GameStats.mana > 3:
						if !global_position.distance_to(get_viewport().get_camera_2d().get_global_mouse_position()) > spells_distance:
							spawnTheBlizzard()
							GameStats.mana -= 2
							takeABreath(0.2)
				6:
					if GameStats.mana > 4:
						if !global_position.distance_to(get_viewport().get_camera_2d().get_global_mouse_position()) > spells_distance:
							spawnTheFirewall()
							GameStats.mana -= 3
							takeABreath(0.3)
				7:
					if GameStats.mana > 51:
						summonTheBat()
						GameStats.mana -= 50
						takeABreath(2)


func takeABreath(delay):
	GameStats.already_spelling = true
	await get_tree().create_timer(delay).timeout
	hideEffects()
	GameStats.already_spelling = false


func hideEffects():
	if !Input.is_action_pressed("shield"):
		$"Shield sound".stop()
		shield_is_activated = false
	
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) or !GameStats.choosed_spell == 3:
		$"Healing sound".stop()
		$Healing.emitting = false


func showTeleport():
	var teleport = load("res://Entities/Spells/teleport.tscn")
	teleport = teleport.instantiate()
	teleport.global_position = global_position
	get_tree().current_scene.add_child(teleport)


func manaRestore():
	if GameStats.mana < GameStats.max_mana:
		GameStats.mana += 1.0 / mana_restore_speed


func spawnTheFireball():
	var fireball = load("res://Entities/Spells/fireball.tscn")
	fireball = fireball.instantiate()
	fireball.global_position = global_position
	fireball.look_at(get_viewport().get_camera_2d().get_local_mouse_position())
	get_tree().current_scene.add_child(fireball)


func spawnTheBlizzard():
	var blizzard = load("res://Entities/Spells/blizzard.tscn")
	blizzard = blizzard.instantiate()
	blizzard.global_position = get_viewport().get_camera_2d().get_global_mouse_position()
	get_tree().current_scene.add_child(blizzard)


func spawnTheFirewall():
	var firewall = load("res://Entities/Spells/firewall.tscn")
	firewall = firewall.instantiate()
	firewall.global_position = get_viewport().get_camera_2d().get_global_mouse_position()
	get_tree().current_scene.add_child(firewall)


func summonTheBat():
	var bat = load("res://Entities/Spells/bat.tscn")
	bat = bat.instantiate()
	bat.global_position = global_position
	get_tree().current_scene.add_child(bat)
