extends Node

func _ready():
	prepInputs()
	pass

func prepInputs():
	var event = InputEventKey.new()
	
	InputMap.add_action('up', 0.5)
	event.scancode = KEY_W
	InputMap.action_add_event('up', event)
	event = InputEventKey.new()
	event.scancode = KEY_UP
	InputMap.action_add_event('up', event)
	
	event = InputEventKey.new()
	InputMap.add_action('down', 0.5)
	event.scancode = KEY_S
	InputMap.action_add_event('down', event)
	event = InputEventKey.new()
	event.scancode = KEY_DOWN
	InputMap.action_add_event('down', event)

	event = InputEventKey.new()
	InputMap.add_action('left', 0.5)
	event.scancode = KEY_A
	InputMap.action_add_event('left', event)
	event = InputEventKey.new()
	event.scancode = KEY_LEFT
	InputMap.action_add_event('left', event)

	event = InputEventKey.new()
	InputMap.add_action('right', 0.5)
	event.scancode = KEY_D
	InputMap.action_add_event('right', event)
	event = InputEventKey.new()
	event.scancode = KEY_RIGHT
	InputMap.action_add_event('right', event)

	event = InputEventKey.new()
	event.scancode = KEY_SPACE
	InputMap.add_action('space', 0.5)
	InputMap.action_add_event('space', event)


	event = InputEventMouseButton.new()
	event.button_index = BUTTON_LEFT
	InputMap.add_action('leftclick', 0.5)
	InputMap.action_add_event('leftclick', event)

	event = InputEventMouseButton.new()
	event.button_index = BUTTON_RIGHT
	InputMap.add_action('rightclick', 0.5)
	InputMap.action_add_event('rightclick', event)

	event = InputEventMouseButton.new()
	event.button_index = BUTTON_WHEEL_UP
	InputMap.add_action('scrollup', 0.5)
	InputMap.action_add_event('scrollup', event)

	event = InputEventMouseButton.new()
	event.button_index = BUTTON_WHEEL_DOWN
	InputMap.add_action('scrolldown', 0.5)
	InputMap.action_add_event('scrolldown', event)
	
	event = InputEventKey.new()
	event.scancode = KEY_Q
	InputMap.add_action('E', 0.5)
	InputMap.action_add_event('E', event)
	
	event = InputEventKey.new()
	event.scancode = KEY_E
	InputMap.add_action('Q', 0.5)
	InputMap.action_add_event('Q', event)
	
	pass
