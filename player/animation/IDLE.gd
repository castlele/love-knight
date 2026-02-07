extends AnimationObject

func get_animation_name() -> String:
	return "idle"

func should_play_animation(state: PlayerState) -> bool:
	return not state.is_moving and state.current_velocity.x == 0 and not state.is_jumping and state.is_on_floor
