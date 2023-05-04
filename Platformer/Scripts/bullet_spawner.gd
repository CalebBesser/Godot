extends Node

var bullet = preload("res://Scenes/bullet.tscn");
signal spawn;
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new();
	add_child(timer);
	timer.wait_time = 1.5;
	timer.autostart = true;
	timer.one_shot = false;
	timer.start();
	timer.timeout.connect(_on_timeout);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	var tempBullet = bullet.instantiate();
	add_child(tempBullet);
	tempBullet.position = Vector2(0, randf_range(0, get_viewport().size.y));
	
