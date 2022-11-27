extends Node2D

var level1 = preload("res://Scenes/Main.tscn")


func _ready():
	pass # Play main menu music



func _on_play_pressed():
	get_tree().change_scene_to(level1)


func _on_quit_pressed():
	get_tree().quit()
