extends Node

@export var speed: int = 220
@export var jump_velocity: int = speed * 2
@export var acceleration: int = 50
@export var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var coyote_timer: Timer = $CoyoteTimer

var _is_coyoting = false

func update_movement(player: Player, input: InputController, delta: float) -> void:
	if player.is_on_floor():
		_is_coyoting = false

	if not player.is_on_floor():
		if coyote_timer.is_stopped() and not _is_coyoting:
			coyote_timer.start()
			_is_coyoting = true

		player.velocity.y += gravity * delta

	if input.is_jumping and (player.is_on_floor() or coyote_timer.time_left != 0):
		coyote_timer.stop()
		_is_coyoting = true
		player.velocity.y = -jump_velocity

	match input.moving_direction:
		InputController.Direction.NONE:
			player.velocity.x = move_toward(player.velocity.x, 0, acceleration)
		InputController.Direction.LEFT:
			player.velocity.x = move_toward(player.velocity.x, -speed, acceleration)
		InputController.Direction.RIGHT:
			player.velocity.x = move_toward(player.velocity.x, speed, acceleration)

	player.move_and_slide()
