extends Node2D

var is_entered = false;
var type = "";
var tier = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().spawned_mine.connect(_on_mine_spawn);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event.is_action("left_click") and is_entered:
		pass
			
func _on_area_2d_mouse_entered():
	is_entered = true;
	Globals.canBuild = false;
	print("entered");
	
func _on_area_2d_mouse_exited():
	is_entered = false;
	print("left");
	
func _on_mine_spawn():
	print(type + "mine")
	Globals.canBuild = false;
	print(Globals.canBuild)
	match type:
		"coal":
			$sprite.set_frame(0);
		"iron":
			$sprite.set_frame(1);
