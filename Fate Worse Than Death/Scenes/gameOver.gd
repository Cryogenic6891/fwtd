extends Node2D

onready var screenManager = get_node("/root/ScreenManager")
onready var level1 = "res://Scenes/Main.tscn"
onready var level2 = "res://Scenes/level2.tscn"




func _on_quit_pressed():
	get_tree().quit()


func _on_continue_pressed():
	if screenManager.currentScene == "level1":
		get_tree().change_scene_to(load(level1))
	elif screenManager.currentScene == "level2":
		get_tree().change_scene_to(load(level2))
