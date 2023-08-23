extends CastSpells

var speed = 100
var flip = "right"
var somersaults = false
var somersaultsDelay = false
var acceleration = 4


func _process(delta):
	match flip:
		"right":
			pass
		"left":
			pass
	
	if Input.is_action_pressed("right")\
or Input.is_action_pressed("up")\
or Input.is_action_pressed("left")\
or Input.is_action_pressed("down"):
		$Body.play("Walk")
	else:
		$Body.play("Idle")
	
	if Input.is_action_just_pressed("somersaults"):
		if !somersaultsDelay and velocity != Vector2.ZERO:
			doSomersaults()
	
	if somersaults:
		$AnimationPlayer.play("Somersaults")
	
	GameStats.mark_position = global_position
	
	castingSpells()
	
	if somersaults:
		shield_is_activated = false
		GameStats.already_spelling = false
	
	if GameStats.already_spelling:
		$Hand.play("Spelling")
	else:
		$Hand.play("Idle")


func _physics_process(delta):
	if !somersaults:
		velocity = Vector2(0, 0)
		if Input.is_action_pressed("left"):
			velocity.x = -speed
			flip = "left"
		if Input.is_action_pressed("right"):
			velocity.x = speed
			flip = "right"
		if Input.is_action_pressed("up"):
			velocity.y = -speed
		if Input.is_action_pressed("down"):
			velocity.y = speed
	
	move_and_slide()


func doSomersaults():
	somersaults = true
	velocity *= acceleration
	somersaultsDelay = true
	await get_tree().create_timer(0.5).timeout
	somersaults = false
	await get_tree().create_timer(2).timeout
	somersaultsDelay = false
