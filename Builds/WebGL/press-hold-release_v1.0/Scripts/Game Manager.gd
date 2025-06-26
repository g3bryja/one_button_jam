extends Node


const ACTION = 'button'

@export var press_timer: Timer
@export var hold_action_time: float = 1

signal button_press
signal button_release


func _ready():
	press_timer.one_shot = true
	press_timer.wait_time = hold_action_time


func _physics_process(_delta):
	# on press
	if Input.is_action_just_pressed(ACTION):
		button_press.emit()
		press_timer.start()
	# on release
	elif Input.is_action_just_released(ACTION):
		button_release.emit()
		press_timer.stop()
	# on hold
	elif Input.is_action_pressed(ACTION) and press_timer.is_stopped():
		button_press.emit()
		press_timer.start()

