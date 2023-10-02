extends Node


var health = 120.0
var max_health = 120.0
var mana = 120.0
var max_mana = 120.0
var experience = 0.0
var experience_to_levelup = 9.0
var level = 0
var milk_count = 0
var choosed_spell = 1
var opened_spells = []
var mark_position = Vector2.ZERO
var already_spelling = false
var healing_delay = 10.0
var healing_delay_left = 0.0
var healing_strength = 1
var undead = false


func _process(delta):
	milk_count = get_tree().get_nodes_in_group("milk").size()


func _physics_process(delta):
	healing_delay_left -= 1.0/60
	
	if healing_delay_left <= 0 and health < max_health:
		health += healing_strength


func spells():
	opened_spells = ["telekinesis", "fireball", "healing", "teleport", "blizzard", "firewall", "summon a bat", "shield"]


func showSpellDescription(spell_name, texture, description):
	for i in get_tree().current_scene.get_children():
		if i is GameUI:
			i.showSpellDescription(spell_name, texture, description)


func showDialog(char_name, texture, telling):
	for i in get_tree().current_scene.get_children():
		if i is GameUI:
			i.showDialog(char_name, texture, telling)


func takeDamage(damage):
	if !undead:
		healing_delay_left = healing_delay
		health -= damage
