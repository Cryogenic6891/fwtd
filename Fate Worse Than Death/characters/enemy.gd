extends KinematicBody2D
onready var player = get_tree().get_nodes_in_group("player")[0]
onready var main = get_tree().get_nodes_in_group("main")[0]
onready var gameOver = preload("res://Scenes/gameOver.tscn")
onready var farPlayer = $far
onready var medPlayer = $medium
onready var nearPlayer = $near
onready var roarPlayer = $roar
onready var anim = $AnimationPlayer

var speed = 110
var velocity = 0
var lit = false

var nearDist = false
var medDist = false

func _ready():
	medPlayer.play()
	anim.play("norm")

func _physics_process(delta):
	if lit == false:
		look_at(player.position)
		velocity = main.nav.get_closest_point(player.position) - position
		var movement = velocity.normalized()
		move_and_slide(movement*speed)
		

func _process(delta):
	for i in get_slide_count():
		var collision = get_slide_collision(i).collider
		if collision == player:
			get_tree().change_scene_to(gameOver)
