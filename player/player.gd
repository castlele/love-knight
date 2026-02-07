class_name Player extends CharacterBody2D

@export var state: PlayerState = load("res://player/resource/player_state.tres")

@onready var input_controller: Node = $InputController
@onready var animation_controller: Node = $AnimationController
@onready var movement_controller: Node = $MovementController

func _physics_process(delta: float) -> void:
	input_controller.update_input()
	movement_controller.update_movement(self, input_controller, delta)

	_save_state()

	animation_controller.play_animation(state)

func _save_state() -> void:
	state.current_velocity = velocity
	state.is_on_floor = is_on_floor()
	state.is_jumping = input_controller.is_jumping
	state.is_moving = input_controller.moving_direction != InputController.Direction.NONE
