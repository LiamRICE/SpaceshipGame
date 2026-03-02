extends CanvasLayer

var UIManager = UiManager

func _on_play_game_button_pressed() -> void:
	UIManager.navigate_to("ui_host_game")


func _on_join_game_button_pressed() -> void:
	UIManager.navigate_to("ui_join_game")


func _on_settings_button_pressed() -> void:
	UIManager.navigate_to("ui_settings")
