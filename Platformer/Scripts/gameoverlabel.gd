extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var words = "Game Over\n";
	var texts = words + "Score: " + str(Signals.score)
	text = texts;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
