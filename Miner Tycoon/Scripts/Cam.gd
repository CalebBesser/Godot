extends Camera2D

var mouse_start_pos;
var screen_start_position;
var max_scroll: Vector2 = Vector2(1200, 675)
var min_zoom: float = 1.5;
var max_zoom: float = 3.0;
var dragging = false;


func _ready():
	zoom = Vector2(1.5, 1.5)

func _input(event):
	if event.is_action("left_click"):
		if event.is_pressed():
			mouse_start_pos = event.position;
			screen_start_position = position;
			dragging = true;
		else:
			dragging = false;
	elif event is InputEventMouseMotion and dragging:
		var new_pos = (screen_start_position - (event.position - mouse_start_pos))
		if new_pos.x < 720:
			new_pos.x =720
		elif new_pos.x > max_scroll.x:
			new_pos.x = max_scroll.x
		if new_pos.y < 405:
			new_pos.y = 405
		elif new_pos.y > max_scroll.y:
			new_pos.y = max_scroll.y
		position = new_pos
	elif event is InputEventMouseButton and event.is_action("scroll_down"):
		if zoom.x > min_zoom and zoom.y > min_zoom:
			zoom -= Vector2(0.01, 0.01);
	elif event is InputEventMouseButton and event.is_action("scroll_up"):
		if zoom.x < max_zoom and zoom.y < max_zoom:
			zoom += Vector2(0.01, 0.01);
