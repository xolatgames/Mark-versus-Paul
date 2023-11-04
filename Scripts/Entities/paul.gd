extends ChangingDirection

class_name Paul

var speed = 100
var have_started = false
var bullet = "fireball"
var number_of_firering_bullets = 16
var number_of_fireball_bullets = 3
var enemy = "Enemies/robot"
var robot_shooting_speed = 3
var robot_spawning_time = 30


func _process(delta):
	if !$Fly.playing:
		$Fly.play()
	
	if GameStats.boss_health <= 0:
		GameStats.scene = "res://Scenes/final.tscn"
		GameStats.saveGame()
		await get_tree().process_frame
		get_tree().change_scene_to_file("res://Scenes/final.tscn")


func _physics_process(delta):
	if have_started:
		velocity = Vector2.from_angle(direction) * speed
		
		$"Fly direction".target_position = Vector2.from_angle(direction) * 20
		
		if $"Fly direction".is_colliding():
			changeDirection()
	
	flipping()
	
	move_and_slide()


func takeDamage(damage):
	if have_started:
		GameStats.boss_health -= damage


func firering():
	for i in range(number_of_firering_bullets):
		var bullet_obj = load("res://Entities/Bullets/"+bullet+".tscn")
		bullet_obj = bullet_obj.instantiate()
		bullet_obj.is_this_fron_enemy = true
		
		bullet_obj.position = position
		bullet_obj.rotation_degrees = i as float / number_of_firering_bullets as float * 360.0
		bullet_obj.collision_mask = pow(2, 1-1) + pow(2, 2-1)
		
		get_tree().current_scene.add_child(bullet_obj)
	
	$AnimatedSprite2D.play("Spelling")


func fireballs():
	for i in range(number_of_fireball_bullets):
		var bullet_obj = load("res://Entities/Bullets/"+bullet+".tscn")
		bullet_obj = bullet_obj.instantiate()
		bullet_obj.is_this_fron_enemy = true
		
		bullet_obj.position = position
		bullet_obj.look_at(GameStats.mark_position)
		bullet_obj.rotation_degrees += -10 + i * 10
		bullet_obj.collision_mask = pow(2, 1-1) + pow(2, 2-1)
		
		get_tree().current_scene.add_child(bullet_obj)
	
	$AnimatedSprite2D.play("Attack")


func spawnTheEnemy():
	var obj = load("res://Entities/"+enemy+".tscn")
	obj = obj.instantiate()
	obj.position = position + Vector2(randf_range(-1, 1), randf_range(-1, 1))
	get_tree().current_scene.add_child(obj)


func _on_change_direction_timeout():
	changeDirection()


func _on_firering_timeout():
	firering()
	
	$Fireballs.start()


func _on_fireballs_timeout():
	fireballs()
	
	$Firering.start()


func _on_spawn_the_enemy_timeout():
	spawnTheEnemy()
	
	$"Spawn the enemy".start(robot_spawning_time + randf_range(0, 1))


func start():
	changeDirection()
	$"Change direction".start()
	$Fireballs.start()
	$"Spawn the enemy".start(robot_spawning_time + randf_range(0, 1))
	have_started = true


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "Attack" or $AnimatedSprite2D.animation == "Spelling":
		$AnimatedSprite2D.play("Fly")
