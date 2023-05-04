extends CharacterBody2D

var grav = 50;
var size = 0.1;
var floorDrop = preload("res://Assets/raindrop_floor.png");
func _ready():
	self.get_node("Sprite2D").scale = Vector2(size, size);

func _physics_process(delta):
	size = size + 0.008;
	move_and_slide();
	if !is_on_floor():
		self.get_node("Sprite2D").scale = Vector2(size, size);
		grav = grav + 10;
		position.y += grav * delta;
	if is_on_floor():
		self.get_node("Sprite2D").set_texture(floorDrop);
		var timer = Timer.new();
		add_child(timer);
		timer.wait_time = 1.0;
		timer.one_shot = true;
		timer.start();
		timer.timeout.connect(_on_timer_timeout);

func _on_timer_timeout():
	queue_free();

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
