extends Node

var circleScene = preload("res://Scenes/circle.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Space"):
		var circle = circleScene.instantiate();
		circle.position = Vector2(randf_range(40, 1000), randf_range(40, 600));
		add_child(circle);
