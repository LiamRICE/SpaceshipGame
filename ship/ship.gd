extends Node2D

@export var speed: float = 100.0

var timer: float = 0.0
var moving_left: bool = true

func _physics_process(delta: float) -> void:
	timer += delta
	
	# Switch direction every 5 seconds
	if timer >= 5.0:
		timer = 0.0
		moving_left = !moving_left
	
	# Move based on direction
	if moving_left:
		position.x -= speed * delta
	else:
		position.x += speed * delta
