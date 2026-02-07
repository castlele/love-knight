extends Node

@export var animation_player: AnimatedSprite2D

func play_animation(state: PlayerState) -> void:
	var children = get_children()

	for child in children:
		if child is not AnimationObject:
			continue

		if child.should_play_animation(state):
			_play(child.get_animation_name())
			return

func _play(_name: String) -> void:
	if animation_player.animation != _name:
		animation_player.play(_name)
