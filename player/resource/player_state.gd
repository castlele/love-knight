class_name PlayerState extends Resource

@export var velocity: float = 1000
@export var jump_velocity: float = velocity * 2

var current_velocity = Vector2.ZERO
var is_on_floor: bool = true
var is_jumping: bool = false
var is_moving: bool = false
