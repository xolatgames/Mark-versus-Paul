extends Enemy

class_name Melee

var moved = false
var attacked = false


func _process(delta):
	if $VisibleOnScreenNotifier2D.is_on_screen() and !neutralize:
		moved = true


func _physics_process(delta):
	if !neutralize:
		checkBats()
		
		if !attacked:
			if moved:
				$AnimatedSprite2D.play("Walk")
				
				if bats_obj.size() == 0:
					velocity = position.direction_to(GameStats.mark_position) * speed
				else:
					velocity = position.direction_to(bat.position) * speed
				
				move_and_slide()
			else:
				$AnimatedSprite2D.play("Idle")
			
			if bats_obj.size() == 0:
				if position.distance_to(GameStats.mark_position) <= damage_radius and !attacked:
					attacking()
					GameStats.takeDamage(damage)
			else:
				if position.distance_to(bat.position) <= damage_radius and !attacked:
					attacking()
					bat.takeDamage(damage)
		
		flipping()
	
		if health <= 0:
			neutralizing()


func attacking():
	$"Attack sound".play()
	$AnimatedSprite2D.play("Attack")
	attacked = true


func neutralizing():
	$AnimatedSprite2D.play("Neutralize")
	neutralize = true
	GameStats.experience += 1
	collision_layer = 0
	moved = false
	attacked = false


func _on_animated_sprite_2d_animation_finished():
	if attacked:
		attacked = false
	
	if $AnimatedSprite2D.animation == "Walk":
		$"Walk sound".play()
