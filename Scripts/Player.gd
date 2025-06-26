extends Node2D


var _LEFT = 'left'
var _RIGHT = 'right'
var _UP = 'up'
var _DOWN = 'down'

var direction = _RIGHT

@export var sprite_up: Sprite2D
@export var sprite_down: Sprite2D
@export var sprite_left: Sprite2D
@export var sprite_right: Sprite2D

@export var player_collider: Area2D
@export var player_forward_collider: Area2D
var _can_move_forward = true
var _queue_prevent_move_forward = false
@export var hit_audio: AudioStreamPlayer


func _ready():
	sprite_right.visible = false
	sprite_down.visible = false
	sprite_left.visible = false
	sprite_up.visible = false


func _process(_delta):
	var dir = int(rotation_degrees / 90) % 4
	match dir:
		0:
			direction = _RIGHT
		1:
			direction = _DOWN
		2:
			direction = _LEFT
		3:
			direction = _UP
	_update_sprite()


func _physics_process(_delta):
	if _queue_prevent_move_forward:
		_queue_prevent_move_forward = false
		_can_move_forward = false


func _update_sprite():
	sprite_right.visible = direction == _RIGHT
	sprite_down.visible = direction == _DOWN
	sprite_left.visible = direction == _LEFT
	sprite_up.visible = direction == _UP


func _on_star_collision(_collision: Area2D):
	#print("WIN")
	return


func _on_car_collision(_collision: Area2D):
	if (_collision == player_collider):
		hit_audio.play()
		get_tree().change_scene_to_file('res://Scenes/Level 3.tscn')


func _on_wall_collision(_collision: Area2D):
	if (_collision == player_forward_collider):
		_queue_prevent_move_forward = true


func _on_wall_exit(_collision: Area2D):
	if (_collision == player_forward_collider):
		_can_move_forward = true


func can_move_forward():
	return _can_move_forward
