extends Node2D


@export var timer: Timer

@export var play_dot_press: Sprite2D
@export var play_dot_hold1: Sprite2D
@export var play_dot_hold2: Sprite2D
@export var play_dot_hold3: Sprite2D

@export var play_check_press: Sprite2D
@export var play_check_hold1: Sprite2D
@export var play_check_hold2: Sprite2D
@export var play_check_hold3: Sprite2D

@export var quit_dot_press: Sprite2D
@export var quit_dot_hold1: Sprite2D
@export var quit_dot_hold2: Sprite2D
@export var quit_dot_hold3: Sprite2D

@export var quit_check_press: Sprite2D
@export var quit_check_hold1: Sprite2D
@export var quit_check_hold2: Sprite2D
@export var quit_check_hold3: Sprite2D

var play_selected = true
var action_count = 0
var action_count_max = 4
@export var audio: AudioStreamPlayer
var queue_play = false
var queue_quit = false


func _ready():
	timer.one_shot = true
	_update_ui()


func _process(_delta):
	if timer.is_stopped():
		if queue_play:
			get_tree().change_scene_to_file('res://Scenes/Level 1.tscn')
		elif queue_quit:
			get_tree().quit()


func on_press():
	action_count += 1
	_update_ui()


func on_release():
	if (action_count >= action_count_max):
		audio.play()
		timer.start()
		if play_selected:
			queue_play = true
			#get_tree().change_scene_to_file('res://Scenes/Level 1.tscn')
			pass
		else:
			queue_quit = true
			#get_tree().quit()
	else:
		action_count = 0
		play_selected = not play_selected
	_update_ui()


func _update_ui():
	play_dot_press.visible = play_selected
	play_dot_hold1.visible = play_selected
	play_dot_hold2.visible = play_selected
	play_dot_hold3.visible = play_selected

	play_check_press.visible = play_selected and action_count >= 1
	play_check_hold1.visible = play_selected and action_count >= 2
	play_check_hold2.visible = play_selected and action_count >= 3
	play_check_hold3.visible = play_selected and action_count >= 4

	quit_dot_press.visible = not play_selected
	quit_dot_hold1.visible = not play_selected
	quit_dot_hold2.visible = not play_selected
	quit_dot_hold3.visible = not play_selected

	quit_check_press.visible = not play_selected and action_count >= 1
	quit_check_hold1.visible = not play_selected and action_count >= 2
	quit_check_hold2.visible = not play_selected and action_count >= 3
	quit_check_hold3.visible = not play_selected and action_count >= 4
