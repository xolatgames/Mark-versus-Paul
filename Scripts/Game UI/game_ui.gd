extends SpellDescription

class_name  GameUI


func _ready():
	$"Spell discription/Panel/Close".connect("pressed", Callable(self, "closeDescription"))


func _process(delta):
	$"Health Stat/Bar".value =  GameStats.health as float / GameStats.max_health as float
	$"Mana Stat/Bar".value =  GameStats.mana as float / GameStats.max_mana as float
	$"Experience Stat/Bar".value =  GameStats.experience as float / GameStats.experience_to_levelup as float
	$"Experience Stat/Level".text = str(GameStats.level)
	$"Items Stat/Milk Counter".text = str(GameStats.milk_count)
	
	if Input.is_action_just_pressed("ui_cancel"):
		await  get_tree().process_frame
		$"Game menu".show()
	
	if Input.is_action_just_pressed("cheat console"):
		await  get_tree().process_frame
		$"Cheat Console".show()
