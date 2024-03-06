extends Node

@onready var BG = preload("res://scene/battleground.tscn")
@onready var G = preload("res://icon.svg")
# Called when the node enters the scene tree for the first time.

func _ready():
	var gg = BG.instantiate()
	$CanvasLayer.set_transform(Transform2D(Vector2(1, 0), Vector2(0, 1), Vector2($Panel.position.x,$Panel.position.y)))
	$CanvasLayer.scale = $Panel.scale
	$CanvasLayer.add_child(gg)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
