extends Label



var score = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Score: 0";
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.BLACK
	add_theme_stylebox_override("normal", new_sb)
	
	var timer = Timer.new();
	add_child(timer);
	timer.wait_time = 1;
	timer.autostart = true;
	timer.one_shot = false;
	timer.start();
	timer.timeout.connect(_on_timeout);
	Signals.hit.connect(_on_gothit);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	score = score + 1;
	var words = "Score: ";
	var texts = words + str(score);
	text = texts;


func _on_gothit():
	Signals.score = score;
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn");
