extends Label

var score = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(score);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_touch():
	score = score + 1;
	self.text = str(score);
