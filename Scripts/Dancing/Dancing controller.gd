extends Node2D

class_name DancingController

signal lose

var current_arrow = 0
var arrows = []
var right = true


func _ready():
	var children = get_children()
	
	for i in children:
		if i is AnimatedSprite2D:
			arrows.append(i)
	
	for i in arrows:
		i.play("Simple")


func _process(delta):
	if Input.is_action_just_pressed("up"):
		if current_arrow == 0:
			get_child(current_arrow).play("Right")
			$Right.play()
			right = true
		else:
			get_child(current_arrow).play("Wrong")
			$Wrong.play()
			right = false
	
	if Input.is_action_just_pressed("left"):
		if current_arrow == 1:
			get_child(current_arrow).play("Right")
			$Right.play()
			right = true
		else:
			get_child(current_arrow).play("Wrong")
			$Wrong.play()
			right = false
	
	if Input.is_action_just_pressed("right"):
		if current_arrow == 2:
			get_child(current_arrow).play("Right")
			$Right.play()
			right = true
		else:
			get_child(current_arrow).play("Wrong")
			$Wrong.play()
			right = false
	
	if Input.is_action_just_pressed("down"):
		if current_arrow == 3:
			get_child(current_arrow).play("Right")
			$Right.play()
			right = true
		else:
			get_child(current_arrow).play("Wrong")
			$Wrong.play()
			right = false
	
	if GameStats.health <= 0:
		GameStats.health = GameStats.max_health
		emit_signal("lose")


func _on_timer_timeout():
	for i in arrows:
		i.play("Simple")
	
	var random_arrow = randi_range(0, arrows.size() - 1)
	current_arrow = random_arrow
	get_child(current_arrow).play("Press me")
	
	if !right:
		$Wrong.play()
		GameStats.takeDamage(20)
	
	right = false
