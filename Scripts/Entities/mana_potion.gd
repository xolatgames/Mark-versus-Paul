extends Area2D

class_name ManaPotion

var increase_mana_point = 100


func _on_body_entered(body):
	if body is Mark:
		GameStats.mana += increase_mana_point
		
		if GameStats.mana > GameStats.max_mana:
			GameStats.mana = GameStats.max_mana
		
		queue_free()
