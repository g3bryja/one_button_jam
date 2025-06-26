extends Node2D


@export var player: Node2D
@export var label: Label


func _ready():
	label.text = ''


func on_win(_collision):
	if _collision == player:
		label.text = 'LEVEL COMPLETE!'
