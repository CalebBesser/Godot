extends Node

var enemy = preload("res://Scenes/enemy.tscn");
signal spawn;
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new();
	add_child(timer);
	timer.wait_time = 5;
	timer.autostart = true;
	timer.one_shot = false;
	timer.start();
	timer.timeout.connect(_on_timeout);
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	var tempEnemy = enemy.instantiate();
	add_child(tempEnemy);
	var positions = [Vector2(284, 200), Vector2(647, 501), Vector2(732, 190)]
	tempEnemy.position = positions[randi() % positions.size()];
	
