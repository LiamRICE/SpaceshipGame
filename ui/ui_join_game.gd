extends CanvasLayer

const MultiplayerUtils := preload("uid://dsjtduynxhntj")


func _on_join_button_pressed() -> void:
	NetworkHandler.join_game(%IPTextEdit.text)
