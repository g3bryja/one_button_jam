extends Node2D


@export var player: Node2D
@export var move_time: float


func _physics_process(_delta):
	position = lerp(position, player.position, move_time)
