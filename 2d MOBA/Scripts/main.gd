extends Node

@onready var globalTimerCounter = Timer.new();
@onready var menu = $Menu

var multiplayer_peer = ENetMultiplayerPeer.new()



func _ready():
	globalTimerCounter.set_wait_time(1);
	add_child(globalTimerCounter);
	globalTimerCounter.start();
	globalTimerCounter.timeout.connect(on_timeout);

func on_timeout():
	Globals.globalTime = Globals.globalTime + 1;
	print(Globals.globalTime);



func _on_host_pressed():
	var port = str($Menu/PortInput.text).to_int();
	multiplayer_peer.create_server(port);
	multiplayer.multiplayer_peer = multiplayer_peer;
	multiplayer_peer.peer_connected.connect(func(id): add_player_character(id))
	menu.visible = false;
	add_player_character();


func _on_join_pressed():
	var port = str($Menu/PortInput.text).to_int()
	multiplayer_peer.create_client("localhost", port);
	multiplayer.multiplayer_peer = multiplayer_peer;
	menu.visible = false;



func add_player_character(id=1):
	var character = preload("res://Scenes/Xenith.tscn").instantiate()
	character.name = str(id);
	add_child(character)
