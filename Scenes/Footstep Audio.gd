extends AudioStreamPlayer


@export var player: Node2D
var played = false


func on_action():
	play()


func on_player_collision(_collision):
	if _collision == player and not played:
		play()
		played = true
