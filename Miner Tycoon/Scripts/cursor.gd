extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Globals.mouse_pos = get_global_mouse_position();
	var snap_pos = Vector2(
		int(Globals.mouse_pos.x / 16) * 16,
		int(Globals.mouse_pos.y / 16) * 16
	)
	position = snap_pos;
