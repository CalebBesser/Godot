extends CharacterBody2D

var max_Speed = 200;
var speed = 0;
var acceleration = 1200;
var move_direction = 0;
var moving = false;
var destination = Vector2();
var movement = Vector2();

var health = 0;
var insanity = 0;

@onready var camera = $Camera2D;
@onready var synchronizer = $MultiplayerSynchronizer;

func _ready():
	synchronizer.set_multiplayer_authority(str(name).to_int());



func _unhandled_input(event):
	if synchronizer.is_multiplayer_authority():
		if event.is_action_pressed("right_click"):
			moving = true;
			destination = get_global_mouse_position();
	
	
func _process(delta):
	if synchronizer.is_multiplayer_authority():
		AnimationLoop();

func _physics_process(delta):
	if synchronizer.is_multiplayer_authority():
		MovementLoop(delta);


func MovementLoop(delta):
	if moving == false:
		speed = 0;
	else:
		speed += acceleration * delta;
		if speed > max_Speed:
			speed = max_Speed;
	movement = position.direction_to(destination) * speed;
	move_direction = rad_to_deg(destination.angle_to_point(position))
	if position.distance_to(destination) > 5:
		velocity = movement;
		move_and_slide();
	else:
		moving = false;

func AnimationLoop():
	var anim_direction = "Left";
	var anim_mode = "Idle";
	var animation;
	if move_direction < 90 and move_direction > 0:
		anim_direction = "Left";
	elif move_direction <= 0 and move_direction > -90:
		anim_direction = "Left";
	elif move_direction >= 90 and move_direction < 180:
		anim_direction = "Right";
	elif move_direction <= -90 and move_direction > -180:
		anim_direction = "Right";
	if moving == true:
		anim_mode = "Walk";
		animation = anim_mode + "_" + anim_direction;
		$AnimatedSprite2D.play(animation);
	if moving == false:
		anim_mode = "Idle";
		$AnimatedSprite2D.play("Idle");
	

