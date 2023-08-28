extends Node


var health = 60.0
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


func spells():
	opened_spells = ["telekinesis", "fireball", "healing", "teleport", "blizzard", "firewall", "summon bat", "shield"]
