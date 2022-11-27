extends Node2D
onready var player = get_tree().get_nodes_in_group("player")[0]
onready var nav = $Navigation

onready var screenManager = get_node("/root/ScreenManager")
onready var gameOver = preload("res://Scenes/gameOver.tscn")

func _ready():
	screenManager.currentScene = "level1"

func _on_Area2D_body_entered(body):
	if body == player:
		get_tree().change_scene_to(gameOver)
