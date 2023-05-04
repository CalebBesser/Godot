extends CharacterBody2D

var grav = 50;
const speed = 200;
var screen_size;
var score = 0;

signal coinTouch(score);
signal gameOver;

func _ready():
	screen_size = get_viewport_rect().size;

func _physics_process(delta):
	move_and_slide();
	if !is_on_floor():
		grav = grav + 10;
		position.y += grav * delta;
	
	if is_on_floor():
		get_input(delta);


func get_input(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1;
	if Input.is_action_pressed("right"):
		velocity.x += 1;
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
	position += velocity * delta;
	position.x = clamp(position.x, 0, screen_size.x);



func _on_area_2d_area_entered(area):
	if area.is_in_group("Coin"):
		score = score + 1;
		coinTouch.emit(score);
	elif area.is_in_group("Fire"):
		gameOver.emit();
