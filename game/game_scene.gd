extends Node2D

const MultiplayerUtils := preload("uid://dsjtduynxhntj")
const Player := preload("uid://pnuyc7yhofwn")

@onready var player_camera := %PlayerCamera

const SPAWN_RANDOM := 5.0


func _ready() -> void:
	NetworkHandler.player_loaded.rpc_id(1)


func start_game(ids:Array[int]):
	print("Game Starting...")
	%MultiplayerPlayerSpawner.spawn_players(ids)
