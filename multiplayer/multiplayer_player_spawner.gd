extends MultiplayerSpawner

@export var network_player: PackedScene

func _ready() -> void:
	pass


func spawn_players(ids:Array[int]):
	if not multiplayer.is_server():
		return
	
	for id in ids:
		var player : CharacterBody2D = network_player.instantiate()
		player.name = str(id)
		
		get_node(spawn_path).call_deferred("add_child", player)
		
		print("Spawned player ", player.name)
