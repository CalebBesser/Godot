extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_highlighter();


func update_highlighter():
	var mouse_pos = get_viewport().get_mouse_position()
	var grid_pos = Vector2(
		int(mouse_pos.x / 16),
		int(mouse_pos.y / 16)
	)
	var highlighter_pos = grid_pos * 16 + Vector2(8, 8)
	$HighLighter.position = highlighter_pos
