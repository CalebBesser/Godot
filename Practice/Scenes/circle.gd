extends CharacterBody2D

var grav = 50;
var size = 0.1;
func _ready():
	self.get_node("Sprite2D").scale = Vector2(size, size);

func _physics_process(delta):
	size = size + 0.008;
	self.get_node("Sprite2D").scale = Vector2(size, size);
	if !is_on_floor():
		grav = grav + 10;
		position.y += grav * delta;

		

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
