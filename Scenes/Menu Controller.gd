extends Node2D


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


func _ready():
	_update_ui()


func on_press():
	action_count += 1
	_update_ui()


func on_release():
	if (action_count >= action_count_max):
		pass
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
