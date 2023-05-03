extends CharacterBody2D

var grav = 50;

func _physics_process(delta):
	if !is_on_floor():
		grav = grav + 10;
		position.y += grav * delta;
		



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
