extends Area2D

var is_player_entered;
var is_
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player_entered:
		look_at(($"../../CharacterBody2D").position)


func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		is_player_entered = true;


func _on_area_2d_area_exited(area):
	if area.is_in_group("Player"):
		is_player_entered = false;
