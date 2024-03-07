extends Node2D


#@onready var CAST = preload("res://scene/minor/cast.tscn")
@onready var CARD = preload("res://scene/minor/card.tscn")
@onready var CASTK = preload("res://scene/minor/cast_meele.tscn")
#@onready var Test = preload("res://scene/minor/cast.tscn")

var friend =[]
var foe =[]
var cards = []
var count = 0

func _ready():
	var x = CARD.instantiate()
	x.position = $Marker2D.position
	cards.append(x)
	add_child(x)

	var y = CARD.instantiate()
	y.position = $Marker2D.position + Vector2(500,200)
	cards.append(y)
	add_child(y)

	var z = CARD.instantiate()
	z.position = $Marker2D.position + Vector2(800,500)
#	cards.append(z)
	add_child(z)
	spawn(z)
	
	pass # Replace with function body.

func spawn(po):
	for i in 3:
		var x  = CASTK.instantiate()
		x.position = po.position + Vector2(i*50, 1*50)
		if po in cards:
			friend.append(x)
			x.bind_self(self)
		else:
			foe.append(x)
			x.bind_self(self)
		add_child(x)
	pass
	
func kill(struk, striker):
#	print('killlllll')
	for i in friend:
		if i == struk:
			friend.erase(i)
		i.target_new(struk)
	for i in foe:
		if i == struk:
			foe.erase(i)
		i.target_new(struk)
	remove_child(struk)
	struk.queue_free()
	pass

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		for i in cards:
			spawn(i)
			pass
	if Input.is_action_just_pressed("ui_left"):
		for i in friend:
			i.add_foes(foe)
		for i in foe:
			i.add_foes(friend)
			pass
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
