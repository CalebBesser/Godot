extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Score: 0";


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_character_coin_touch(score):
	var format = "Score: %d";
	var scoreText = format % [score];
	self.text = scoreText;
