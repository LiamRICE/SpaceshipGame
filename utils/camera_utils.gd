extends Resource

static func offset_toward_mouse(player: CharacterBody2D, distance: float) -> Vector2:
	if player == null:
		return Vector2.ZERO
	
	var mouse_pos = player.get_global_mouse_position()
	var direction = (mouse_pos - player.global_position).normalized()
	
	return player.global_position + direction * distance
