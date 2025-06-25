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


func _update_sprite():
	sprite_right.visible = direction == _RIGHT
	sprite_down.visible = direction == _DOWN
	sprite_left.visible = direction == _LEFT
	sprite_up.visible = direction == _UP

func _on_star_collision(_collision: Area2D):
	print("WIN")
