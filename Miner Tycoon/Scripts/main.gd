extends Node

var manual_mine = preload("res://Scenes/manual_mine.tscn");
var type = "";
signal spawned_mine();
signal opened_shop;
signal closed_shop;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action("left_click"):
		if Globals.canBuild:
			var mine = manual_mine.instantiate();
			add_child(mine);
			match type:
				"coal":
					mine.type = "coal";
				"iron":
					mine.type = "iron";
			mine.position = Vector2(int(Globals.mouse_pos.x / 16) * 16, int(Globals.mouse_pos.y / 16) * 16)
			spawned_mine.emit()
			print("Built")
	if event.is_action("s button"):
		opened_shop.emit();


func _on_shop_quit():
	closed_shop.emit();


func _on_shop_mine_pressed(_type):
	type = _type;
	Globals.canBuild = true;
	print(type)



func _on_shop_entered():
	Globals.canBuild = false;


func _on_shop_exited():
	Globals.canBuild = true;
