extends RigidBody2D


var taked = false
var speed = 20
var taked_distance = 256


func _process(delta):
	if taked:
		GameStats.already_spelling = true
		if global_position.distance_to(GameStats.mark_position) > taked_distance:
			drop()


func _on_input_event(viewport, event, shape_idx):
	if !GameStats.already_spelling:
		if GameStats.choosed_spell == 1:
			if event is InputEventMouseButton:
				if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and !global_position.distance_to(GameStats.mark_position) > taked_distance:
					take()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			drop()
	if event is InputEventMouseMotion:
		if taked:
			apply_impulse(event.relative * speed, global_position)


func drop():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	GameStats.already_spelling = false
	taked = false


func take():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	taked = true
