extends Node2D


@export var player: Node2D
@export var label: Label
@export var timer: Timer
@export var next_level: String
var queue_next_level = false


func _ready():
	label.text = ''


func _process(_delta):
	if queue_next_level and timer.is_stopped():
		get_tree().change_scene_to_file('res://Scenes/' + next_level + '.tscn')


func on_win(_collision):
	if _collision == player:
		label.text = 'LEVEL COMPLETE!'
		if not queue_next_level:
			queue_next_level = true
			timer.start()
