extends Node

var bullet = preload("res://Scenes/bullet.tscn");
var enemy = preload("res://Scenes/enemy.tscn");
var rock = preload("res://Scenes/rock.tscn");

signal spawn;
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var rockTimer = Timer.new();
	add_child(rockTimer);
	rockTimer.wait_time = 2;
	rockTimer.autostart = true;
	rockTimer.one_shot = false;
	rockTimer.start();
	rockTimer.timeout.connect(_on_rock_timeout);
	
	var bulletTimer = Timer.new();
	add_child(bulletTimer);
	bulletTimer.wait_time = 1.5;
	bulletTimer.autostart = true;
	bulletTimer.one_shot = false;
	bulletTimer.start();
	bulletTimer.timeout.connect(_on_bullet_timeout);
	
	var enemyTimer = Timer.new();
	add_child(enemyTimer);
	enemyTimer.wait_time = 5;
	enemyTimer.autostart = true;
	enemyTimer.one_shot = false;
	enemyTimer.start();
	enemyTimer.timeout.connect(_on_enemy_timeout);
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bullet_timeout():
	var tempBullet = bullet.instantiate();
	add_child(tempBullet);
	var positions = [Vector2(64, get_parent().find_child("slime").position.y), Vector2(64, randf_range(64, get_viewport().size.y - 64))];
	tempBullet.position = positions.pick_random();

func _on_rock_timeout():
	var tempRock = rock.instantiate();
	add_child(tempRock);
	var positions = [Vector2(get_parent().find_child("slime").position.x, 64), Vector2(randf_range(64, get_viewport().size.x - 64), 64)]
	tempRock.position = positions.pick_random();;
	
func _on_enemy_timeout():
	var tempEnemy = enemy.instantiate();
	add_child(tempEnemy);
	var positions = [Vector2(284, 200), Vector2(647, 501), Vector2(732, 190)]
	tempEnemy.position = positions[randi() % positions.size()];



