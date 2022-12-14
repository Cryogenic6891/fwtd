extends Node2D

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var nav = $Navigation
onready var jukebox = $jukebox

onready var screenManager = get_node("/root/ScreenManager")
onready var gameOver = preload("res://Scenes/gameOver.tscn")
onready var level2song = preload("res://Sound/Horror 2d Main Theme.wav")


func _ready():
	screenManager.currentScene = "level2"
	jukebox.stream = level2song
	jukebox.autoplay = true

func _on_Area2D_body_entered(body):
	if body == player:
		get_tree().change_scene_to(gameOver)
