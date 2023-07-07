extends Path2D

@onready var minionPathFollower = preload("res://Scenes/path_follow_2d.tscn");
var timer = 0;
var spawnTime = 10;

var timesSpawned = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer = timer + delta;
	
	if (timer > spawnTime):
		for n in range(7):
			var newMinionPathFollower = minionPathFollower.instantiate();
			add_child(newMinionPathFollower);
			await get_tree().create_timer(1 * delta).timeout
		timer = 0;
