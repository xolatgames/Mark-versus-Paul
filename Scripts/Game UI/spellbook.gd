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
	
	
	if GameStats.opened_spells.has("telekinesis"):
		$Spellbook/Telekinesis.show()
		if Input.is_action_just_pressed("telekinesis"):
			GameStats.choosed_spell = 1
	if GameStats.opened_spells.has("fireball"):
		$Spellbook/Fireball.show()
		if Input.is_action_just_pressed("fireball"):
			GameStats.choosed_spell = 2
	if GameStats.opened_spells.has("healing"):
		$Spellbook/Healing.show()
		if Input.is_action_just_pressed("healing"):
			GameStats.choosed_spell = 3
	if GameStats.opened_spells.has("teleport"):
		$Spellbook/Teleport.show()
		if Input.is_action_just_pressed("teleport"):
			GameStats.choosed_spell = 4
	if GameStats.opened_spells.has("blizzard"):
		$Spellbook/Blizzard.show()
		if Input.is_action_just_pressed("blizzard"):
			GameStats.choosed_spell = 5
	if GameStats.opened_spells.has("firewall"):
		$Spellbook/Firewall.show()
		if Input.is_action_just_pressed("firewall"):
			GameStats.choosed_spell = 6
	if GameStats.opened_spells.has("summon bat"):
		$"Spellbook/Summon Bat".show()
		if Input.is_action_just_pressed("summon bat"):
			GameStats.choosed_spell = 7
	if GameStats.opened_spells.has("shield"):
		$"Spellbook/Shield".show()
