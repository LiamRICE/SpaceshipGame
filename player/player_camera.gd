extends Camera2D

const CameraUtils := preload("uid://1lhl1fj8q5t0")

var player : CharacterBody2D

@export var follow_speed: float = 5.0

func _physics_process(delta):
	
	if player and int(player.name) == multiplayer.get_unique_id():
		
		var focus_input = Input.is_action_pressed("focus")
		
		var target_position = player.global_position
		
		if focus_input:
			target_position = CameraUtils.offset_toward_mouse(player, player.get_focus_distance())
		
		if player:
			global_position = global_position.lerp(
				target_position,
				follow_speed * delta
			)
