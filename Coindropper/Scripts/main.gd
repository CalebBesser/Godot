extends Node

var coin = preload("res://Scenes/coin.tscn");
var fire = preload("res://Scenes/fire.tscn");
var timer;

func _ready():
	timer = Timer.new();
	add_child(timer);
	timer.one_shot = false;
	timer.autostart = true;
	timer.wait_time = 1;
	timer.start();
	timer.timeout.connect(_on_timer_timeout);
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var items = [coin, fire];
	var item = items[randi() % items.size()];
	var actual = item.instantiate();
	add_child(actual);
	actual.position = Vector2(randf_range(0, get_viewport().size.x), 0);


func _on_character_game_over():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn");
