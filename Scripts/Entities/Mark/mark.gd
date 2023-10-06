extends CastSpells

class_name Mark

var speed = 100
var somersaults = false
var somersaults_velocity = Vector2.ZERO
var somersaults_delay = false
var acceleration = 4


func _process(delta):
	
	if !dead:
		if Input.is_action_pressed("right")\
or Input.is_action_pressed("up")\
or Input.is_action_pressed("left")\
or Input.is_action_pressed("down"):
			$Body.play("Walk")
		else:
			$Body.play("Idle")
		
		if Input.is_action_just_pressed("somersaults"):
			if !somersaults_delay and velocity != Vector2.ZERO:
				doSomersaults()
		
		if somersaults:
			velocity = somersaults_velocity * acceleration
			$AnimationPlayer.play("Somersaults")
		
		if somersaults:
			shield_is_activated = false
		
		if GameStats.already_spelling:
			$Hand.play("Spelling")
		else:
			$Hand.play("Idle")
		
		flipping()
		
		if GameStats.health <= 0:
			dead = true
			
			$Timer.start(GameStats.confuse_time)
			await $Timer.timeout
			
			GameStats.restartLevel()
	else:
		velocity = Vector2(0, 0)
		shield_is_activated = false
		
		$Body.hide()
		$Hand.hide()
		$Somersaults.hide()
		$Confuse.show()
	
	castingSpells()
	
	GameStats.mark_position = global_position


func _physics_process(delta):
	if !dead:
		if !somersaults:
			velocity = Vector2(0, 0)
			if Input.is_action_pressed("left"):
				velocity.x = -speed
			if Input.is_action_pressed("right"):
				velocity.x = speed
			if Input.is_action_pressed("up"):
				velocity.y = -speed
			if Input.is_action_pressed("down"):
				velocity.y = speed
		
		move_and_slide()
	
	manaRestore()


func doSomersaults():
	somersaults = true
	somersaults_delay = true
	somersaults_velocity = velocity
	$Timer.start(0.5)
	await $Timer.timeout
	somersaults = false
	$Timer.start(2)
	await $Timer.timeout
	somersaults_delay = false


func _on_body_animation_finished():
	if $Body.animation == "Walk":
		$"Walk sound".play()


func _on_confuse_animation_finished():
	if dead:
		$"Confuse sound".play()
	$Confuse.play("default")


func _on_stuck_body_entered(body):
	if !body is Mark:
		GameStats.stuck()
