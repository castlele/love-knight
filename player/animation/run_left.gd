extends AnimationObject

func get_animation_name() -> String:
	return "run_left"

func should_play_animation(_state: PlayerState) -> bool:
	return _state.current_velocity.x < 0 and _state.is_on_floor
