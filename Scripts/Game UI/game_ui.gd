extends Spellbook


func _process(delta):
	$"Health Stat/Bar".value =  GameStats.health as float / GameStats.max_health as float
	$"Mana Stat/Bar".value =  GameStats.mana as float / GameStats.max_mana as float
	$"Experience Stat/Bar".value =  GameStats.experience as float / GameStats.experience_to_levelup as float
	$"Experience Stat/Level".text = str(GameStats.level)
	$"Items Stat/Milk Counter".text = str(GameStats.milk_count)
	
	spelling()
