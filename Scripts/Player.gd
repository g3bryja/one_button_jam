extends Node2D


var _LEFT = 'left'
var _RIGHT = 'right'
var _UP = 'up'
var _DOWN = 'down'

var direction = _RIGHT


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
	print(dir)


func _on_star_collision(collision: Area2D):
	print("WIN")
