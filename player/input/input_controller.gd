class_name InputController extends Node

enum Direction {
	NONE, LEFT, RIGHT,
}

var moving_direction: Direction = Direction.RIGHT
var is_jumping = false

func update_input() -> void:
	var floatDirection = Input.get_axis("move_left", "move_right")

	if floatDirection > 0:
		moving_direction = Direction.RIGHT
	elif floatDirection < 0:
		moving_direction = Direction.LEFT
	else:
		moving_direction = Direction.NONE

	is_jumping = Input.is_action_just_pressed("jump")
