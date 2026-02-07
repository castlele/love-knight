class_name AnimationObject
extends Node

func get_animation_name() -> String:
	assert(false, "Call this method from a child")
	return ""

func should_play_animation(_state: PlayerState) -> bool:
	assert(false, "Call this method from a child")
	return false
