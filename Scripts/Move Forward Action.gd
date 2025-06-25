extends "res://Scripts/Template Action.gd"


@export var move_distance: int


func _on_action():
	if (player.can_move_forward()):
		player.move_local_x(move_distance)
