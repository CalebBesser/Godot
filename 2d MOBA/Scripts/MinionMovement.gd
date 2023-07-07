extends PathFollow2D

@export var moveSpeed = 20;

@onready var minion = preload("res://Scenes/minion.tscn");


func _ready():
	var newMinion = minion.instantiate();
	add_child(newMinion);

func _process(delta):
	set_h_offset(get_h_offset() + moveSpeed * delta);
