extends "res://Scripts/Template Action.gd"


@export var move_distance: int


func _on_action():
	player.move_local_x(move_distance)
