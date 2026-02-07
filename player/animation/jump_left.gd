extends AnimationObject

func get_animation_name() -> String:
	return "jump_left"

func should_play_animation(_state: PlayerState) -> bool:
	var is_up = _state.current_velocity.y != 0
	var is_moving = _state.current_velocity.x < 0

	return is_up and not _state.is_on_floor and is_moving
