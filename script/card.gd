extends Area2D

signal selected

var clicked = false

func _ready():
	pass

func _process(delta):
	if clicked:
		position = get_global_mouse_position()
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Left button was clicked at ", event.position)
			clicked=true
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			print("Left button was released at ", event.position)
			clicked=false
	pass
