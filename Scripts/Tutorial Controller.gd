extends Node2D


var press_count = 0
var press_max = 4

@export var press: Sprite2D
@export var hold1: Sprite2D
@export var hold2: Sprite2D
@export var hold3: Sprite2D
@export var release: Sprite2D
@export var audio: AudioStreamPlayer
@export var timer: Timer


func _ready():
	timer.one_shot = true
	press.visible = false
	hold1.visible = false
	hold2.visible = false
	hold3.visible = false
	release.visible = false


func _process(_delta):
	press.visible = press_count >= 1
	hold1.visible = press_count >= 2
	hold2.visible = press_count >= 3
	hold3.visible = press_count >= 4
	
	if release.visible and timer.is_stopped():
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func on_press():
	press_count += 1


func on_release():
	if press_count >= press_max:
		release.visible = true
		timer.start()
		#get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
		audio.play()
	else:
		press_count = 0
