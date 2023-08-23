extends CanvasLayer

class_name Spellbook


func spelling():
	match GameStats.choosed_spell:
		1:
			$Spellbook/Choosed.position = $Spellbook/Telekinesis.position
		2:
			$Spellbook/Choosed.position = $Spellbook/Fireball.position
		3:
			$Spellbook/Choosed.position = $Spellbook/Healing.position
		4:
			$Spellbook/Choosed.position = $Spellbook/Teleport.position
		5:
			$Spellbook/Choosed.position = $Spellbook/Blizzard.position
		6:
			$Spellbook/Choosed.position = $Spellbook/Firewall.position
		7:
			$Spellbook/Choosed.position = $"Spellbook/Summon Bat".position
	
	if Input.is_action_just_pressed("telekinesis"):
		GameStats.choosed_spell = 1
	if Input.is_action_just_pressed("fireball"):
		GameStats.choosed_spell = 2
	if Input.is_action_just_pressed("healing"):
		GameStats.choosed_spell = 3
	if Input.is_action_just_pressed("teleport"):
		GameStats.choosed_spell = 4
	if Input.is_action_just_pressed("blizzard"):
		GameStats.choosed_spell = 5
	if Input.is_action_just_pressed("firewall"):
		GameStats.choosed_spell = 6
	if Input.is_action_just_pressed("summon_bat"):
		GameStats.choosed_spell = 7
