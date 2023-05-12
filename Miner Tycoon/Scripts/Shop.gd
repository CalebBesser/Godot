extends TabContainer

var is_showing = false;
signal quit
signal mine_pressed(type)
signal entered
signal exited

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_showing:
		scale = Vector2(1, 1);
	if !is_showing:
		scale = Vector2(0, 0);


func _on_main_opened_shop():
	is_showing = true;
	print("shop");


func _on_main_closed_shop():
	is_showing = false;
	print("no shop");


func _on_quit_pressed():
	quit.emit();


func _on_coal_pressed():
	mine_pressed.emit("coal");
	print("coal pressed")


func _on_iron_pressed():
	mine_pressed.emit("iron");
	print("iron pressed")


func _on_manual_mines_mouse_entered():
	entered.emit()


func _on_manual_mines_mouse_exited():
	exited.emit()
