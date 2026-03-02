extends CanvasLayer

var UIManager = UiManager


func _on_back_button_pressed() -> void:
	UIManager.navigate_to("ui_main")
