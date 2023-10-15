extends Enemy

class_name Ranger

var moved = false
var attacked = false
@export var bullet = ""
@export var shooting_speed = 3


func _process(delta):
	if $VisibleOnScreenNotifier2D.is_on_screen() and !neutralize and !moved:
		$Attacking.start(shooting_speed)
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
		
		flipping()
	
		if health <= 0:
			neutralizing()


func attacking(bullet_direction):
	var bullet_obj = load("res://Entities/Bullets/"+bullet+".tscn")
	bullet_obj = bullet_obj.instantiate()
	bullet_obj.is_this_fron_enemy = true
	
	bullet_obj.position = position
	bullet_obj.look_at(bullet_direction)
	bullet_obj.collision_mask = pow(2, 1-1) + pow(2, 2-1)
	
	get_tree().current_scene.add_child(bullet_obj)
	
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


func _on_attacking_timeout():
	if !neutralize:
		if moved:
			if bats_obj.size() == 0:
				attacking(GameStats.mark_position)
			else:
				attacking(bat.position)
