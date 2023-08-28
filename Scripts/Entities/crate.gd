extends RigidBody2D


var taked = false
var speed = 20
var taked_distance = 256


func _process(delta):
	if taked:
		GameStats.already_spelling = true
		if global_position.distance_to(GameStats.mark_position) > taked_distance:
			drop()
		$Pickable.emitting = true
	else:
		$Pickable.emitting = false


func _on_input_event(viewport, event, shape_idx):
	if !GameStats.already_spelling and GameStats.choosed_spell == 1 and !global_position.distance_to(GameStats.mark_position) > taked_distance:
			if event is InputEventMouseButton:
				if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
					take()


func _input(event):
	if taked:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
				drop()
		if event is InputEventMouseMotion:
			apply_impulse(event.relative * speed, global_position)


func drop():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GameStats.already_spelling = false
	taked = false


func take():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	GameStats.already_spelling = true
	taked = true
