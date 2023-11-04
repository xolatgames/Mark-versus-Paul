extends CanvasLayer


func _process(delta):
	$Bar.value =  GameStats.boss_health as float / GameStats.boss_max_health as float
