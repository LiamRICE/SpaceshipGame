extends CanvasLayer

var UIPlayerRepresentation := preload("uid://8u01gr4wqwk")

func _ready():
	NetworkHandler.create_game()
	NetworkHandler.player_connected.connect(on_user_connected)
	NetworkHandler.player_disconnected.connect(on_user_disconnected)
	print("Game hosted.")


func on_user_connected(peer_id:int, player_info:Variant):
	var representation = UIPlayerRepresentation.instantiate()
	representation.set_values(str(player_info), peer_id)
	
	%PlayerListVBoxContainer.add_child(representation)


func on_user_disconnected(peer_id):
	for child in %PlayerListVBoxContainer.get_children():
		if is_instance_of(child, HBoxContainer):
			if child.get_id() == peer_id:
				child.queue_free()


func _on_start_game_pressed():
	#UiManager.load_scene("scene_game")
	NetworkHandler.load_game.rpc("scene_game")
	UiManager.navigate_to("ui_game")
