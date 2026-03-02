extends CharacterBody2D

@export var speed: float = 200.0
@export var sprint_speed: float = 500.0
@export var acceleration: float = 1000.0
@export var friction: float = 3000.0

@export var default_focus_distance = 250.0
@export var player_name: String = "Player"


func _enter_tree() -> void:
	set_multiplayer_authority(int(name))


func _ready():
	if not is_multiplayer_authority():
		return
	
	print("Player created with multiplayer authority ", name)
	get_node("/root/GameScene/PlayerCamera").player = self


func _physics_process(delta):
	if not is_multiplayer_authority():
		return
	
	# --- Movement Input ---
	var input_vector = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()
	
	var is_sprinting = Input.is_action_pressed("move_sprint")
	
	var mouse_position = get_global_mouse_position()
	
	var left_click = Input.is_action_just_pressed("interact")

	# --- Smooth Acceleration / Friction ---
	if input_vector != Vector2.ZERO:
		if is_sprinting:
			velocity = velocity.move_toward(input_vector * sprint_speed, acceleration * delta)
		else:
			velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	move_and_slide()

	# --- Rotate Toward Mouse ---
	look_at(mouse_position)
	
	if left_click:
		emit_mp_signal.rpc()


@rpc("any_peer", "call_local", "reliable")
func emit_mp_signal():
	print("MP Signal")


func get_focus_distance() -> float:
	return default_focus_distance


func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		print("Player deleted. Name: %s" % player_name)
