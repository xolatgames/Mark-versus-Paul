extends CanvasLayer

class_name Spellbook


func _process(delta):
	match GameStats.choosed_spell:
		1:
			$Choosed.position = $Telekinesis.position
		2:
			$Choosed.position = $Fireball.position
		3:
			$Choosed.position = $Healing.position
		4:
			$Choosed.position = $Teleport.position
		5:
			$Choosed.position = $Blizzard.position
		6:
			$Choosed.position = $Firewall.position
		7:
			$Choosed.position = $"Summon a Bat".position
	
	
	if GameStats.opened_spells.has("telekinesis"):
		$Telekinesis.show()
		if Input.is_action_just_pressed("telekinesis"):
			GameStats.choosed_spell = 1
	if GameStats.opened_spells.has("fireball"):
		$Fireball.show()
		if Input.is_action_just_pressed("fireball"):
			GameStats.choosed_spell = 2
	if GameStats.opened_spells.has("healing"):
		$Healing.show()
		if Input.is_action_just_pressed("healing"):
			GameStats.choosed_spell = 3
	if GameStats.opened_spells.has("teleport"):
		$Teleport.show()
		if Input.is_action_just_pressed("teleport"):
			GameStats.choosed_spell = 4
	if GameStats.opened_spells.has("blizzard"):
		$Blizzard.show()
		if Input.is_action_just_pressed("blizzard"):
			GameStats.choosed_spell = 5
	if GameStats.opened_spells.has("firewall"):
		$Firewall.show()
		if Input.is_action_just_pressed("firewall"):
			GameStats.choosed_spell = 6
	if GameStats.opened_spells.has("summon a bat"):
		$"Summon a Bat".show()
		if Input.is_action_just_pressed("summon a bat"):
			GameStats.choosed_spell = 7
	if GameStats.opened_spells.has("shield"):
		$Shield.show()
