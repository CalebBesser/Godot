extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# Called when the node enters the scene tree for the first time.
func _ready():
	var deathTimer = Timer.new();
	add_child(deathTimer);
	deathTimer.wait_time = 10;
	deathTimer.autostart = true;
	deathTimer.one_shot = true;
	deathTimer.start();
	deathTimer.timeout.connect(_on_timeout);




func _physics_process(delta):
	move_and_slide();
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

func _process(delta):
	pass

func _on_timeout():
	queue_free();
