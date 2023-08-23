extends Spellbook


func _process(delta):
	$"Health Stat/Bar".value =  GameStats.health / GameStats.max_health
	$"Mana Stat/Bar".value =  GameStats.mana / GameStats.max_mana
	$"Experience Stat/Bar".value =  GameStats.experience / GameStats.experience_to_levelup
	$"Experience Stat/Level".text = str(GameStats.level)
	$"Items Stat/Milk Counter".text = str(GameStats.milk_count)
	
	spelling()
