extends Node


var health = 120.0
var max_health = 120.0
var mana = 120.0
var max_mana = 120.0
var experience = 0.0
var experience_to_levelup = 20.0
var level = 0
var milk_count = 0
var choosed_spell = 1
var opened_spells = []
var mark_position = Vector2.ZERO
var already_spelling = false
const healing_delay = 10.0
var healing_delay_left = 0.0
var healing_strength = 1
const confuse_time = 5
var undead = false
var scene = "res://Scenes/tutorial.tscn"
var air_left = 120.0
var boss_health = 300.0
var boss_max_health = 300.0


func _process(delta):
	milk_count = get_tree().get_nodes_in_group("milk").size()
	
	if experience >= experience_to_levelup:
		levelUp()


func _physics_process(delta):
	healing_delay_left -= 1.0/60
	
	if healing_delay_left <= 0 and health < max_health:
		health += healing_strength


func newGame():
	health = 120.0
	max_health = 120.0
	mana = 120.0
	max_mana = 120.0
	experience = 0.0
	experience_to_levelup = 9.0
	level = 0
	choosed_spell = 1
	opened_spells = []
	boss_health = 300.0
	boss_max_health = 300.0
	scene = "res://Scenes/tutorial.tscn"


func loadGame():
	var conf = ConfigFile.new()
	conf.load("user://game.ini")
	max_health = conf.get_value("game", "max_health", 120.0)
	max_mana = conf.get_value("game", "max_mana", 120.0)
	experience = conf.get_value("game", "experience", 0.0)
	experience_to_levelup = conf.get_value("game", "experience_to_levelup", 9.0)
	level = conf.get_value("game", "level", 0.0)
	choosed_spell = conf.get_value("game", "choosed_spell", 1)
	opened_spells = conf.get_value("game", "opened_spells", [])
	
	health = max_health
	mana = max_mana
	already_spelling = false
	healing_delay_left = 0
	boss_health = 2000.0
	boss_max_health = 2000.0
	
	scene = conf.get_value("game", "scene", "res://Scenes/tutorial.tscn")


func saveGame():
	var conf = ConfigFile.new()
	conf.set_value("game", "max_health", max_health)
	conf.set_value("game", "max_mana", max_mana)
	conf.set_value("game", "experience", experience)
	conf.set_value("game", "experience_to_levelup", experience_to_levelup)
	conf.set_value("game", "level", level)
	conf.set_value("game", "choosed_spell", choosed_spell)
	conf.set_value("game", "opened_spells", opened_spells)
	conf.set_value("game", "scene", scene)
	conf.save("user://game.ini")


func restartLevel():
	loadGame()
	
	get_tree().change_scene_to_file(scene)


func spells():
	opened_spells = ["telekinesis", "fireball", "healing", "teleport", "blizzard", "firewall", "summon a bat", "shield"]


func nextLevel():
	var milks = get_tree().get_nodes_in_group("milk")
	for i in milks:
		i.queue_free()
	
	if get_tree().current_scene.get_node("Mark") and get_tree().current_scene.get_node("Portal"):
		get_tree().current_scene.get_node("Mark").position = get_tree().current_scene.get_node("Portal").position


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


func levelUp():
	experience -= experience_to_levelup
	experience_to_levelup += 10
	level += 1


func stuck():
	healing_delay_left = confuse_time + 1
	health = 0
