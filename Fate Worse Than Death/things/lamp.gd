extends Sprite
export var endPoint = false

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var jukebox = get_tree().get_nodes_in_group("jukebox")[0]
onready var enemy = get_tree().get_nodes_in_group("enemy")[0]
onready var flashlight = get_tree().get_nodes_in_group("flashlight")[0]
onready var lampAudio = preload("res://Sound/11-02-2022 30 day Horror Game Concepts Lamp Ambience.wav")
onready var normalAudio = preload("res://Sound/11-02-2022 30 day Horror Game Music Concept.wav")
onready var level2Audio = preload("res://Sound/Horror 2d Main Theme.wav")
onready var currentLevel = get_node("/root/ScreenManager")
onready var level2 = "res://Scenes/level2.tscn"
onready var mainMenu = "res://Scenes/credits.tscn"

func _on_Area2D_body_entered(body):
	if body == player:
		jukebox.stream = lampAudio
		jukebox.play()
		enemy.set_physics_process(false)
		flashlight.batteryTimer.stop()
		flashlight.battery = 100
		if endPoint == true:
			if currentLevel.currentScene == "level1":
				get_tree().change_scene_to(load(level2))
			elif currentLevel.currentScene == "level2":
				get_tree().change_scene_to(load(mainMenu))


func _on_Area2D_body_exited(body):
	if body == player:
		if currentLevel.currentScene == "level1":
			jukebox.stream = normalAudio
		elif currentLevel.currentScene == "level2":
			jukebox.stream = level2Audio
		jukebox.play()
		enemy.set_physics_process(true)
		flashlight.batteryTimer.start()
		flashlight.battery = 100
