extends Node2D


@export var speed: float
@export var top: Node2D
@export var bottom: Node2D


func _physics_process(_delta):
	if position.y > bottom.position.y:
		position.y = top.position.y
	
	position.y += speed * _delta
