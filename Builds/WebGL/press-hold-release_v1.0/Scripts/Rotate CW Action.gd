extends "res://Scripts/Template Action.gd"


func _on_action():
	player.rotate(-PI/2)
	player.rotation = fmod(player.rotation, 2 * PI)
