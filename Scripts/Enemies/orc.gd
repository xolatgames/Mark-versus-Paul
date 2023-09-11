extends Enemy

class_name Orc

var moved = false
var attacked = false


func _process(delta):
	if $VisibleOnScreenNotifier2D.is_on_screen() and !neutralize:
		moved = true


func _physics_process(delta):
	if !neutralize:
		if !attacked:
			if moved:
				$AnimatedSprite2D.play("Walk")
				
				velocity = position.direction_to(GameStats.mark_position) * speed
				
				move_and_slide()
			else:
				$AnimatedSprite2D.play("Idle")
		
			if position.distance_to(GameStats.mark_position) <= damage_radius and !attacked:
				$"Attack sound".play()
				$AnimatedSprite2D.play("Attack")
				GameStats.takeDamage(damage)
				attacked = true
	
		if health <= 0:
			$AnimatedSprite2D.play("Neutralize")
			neutralize = true
			moved = false
			attacked = false

func _on_animated_sprite_2d_animation_finished():
	if attacked:
		attacked = false
	
	if $AnimatedSprite2D.animation == "Walk":
		$"Walk sound".play()
