extends Area2D

var grav = 30;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	grav = grav + 5;
	position.y += grav * delta;


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();


func _on_area_entered(area):
	queue_free();
