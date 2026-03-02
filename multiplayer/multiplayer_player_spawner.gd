extends MultiplayerSpawner

@export var network_player: PackedScene

func _ready() -> void:
	if multiplayer.is_server():
		NetworkHandler.player_loaded_scene.connect(spawn_player)
		#spawn_player(1)


func spawn_player(id:int):
	if not multiplayer.is_server():
		return
	
	var player : CharacterBody2D = network_player.instantiate()
	player.name = str(id)
	
	get_node(spawn_path).call_deferred("add_child", player)
	
	print("Spawned player ", player.name)
