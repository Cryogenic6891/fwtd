extends KinematicBody2D

onready var sprite = $Sprite
onready var collider = $CollisionShape2D
onready var flashlight = $Sprite/flashlight
onready var standing = preload("res://Art/pixil-frame-0 (35).png")
onready var crouching = preload("res://Art/pixil-frame-0 (36).png")
onready var anim = $AnimationTree
onready var animMode = anim.get("parameters/playback")

var stairMovement = false
var goingUp
var stairDestination

var velocity = Vector2.ZERO
var speed = 7000
var gravity = 3.5
var maxFall = 2
var jumpStrength = 1.85

var touching
var gripping = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _physics_process(delta):
	velocity.x = Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft")
	if velocity.x != 0:
		anim.set("parameters/idle/blend_position", velocity.x)
		anim.set("parameters/run/blend_position", velocity.x)
		animMode.travel("run")
	else:
		anim.set("parameters/idle/blend_position", velocity.x)
		animMode.travel("idle")
	move_and_slide(velocity*speed*delta, Vector2.UP)
	velocity.y += gravity * delta
	if velocity.y >= maxFall:
		velocity.y = maxFall
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jumpStrength
	if Input.is_action_pressed("jump") and touching == true:
		velocity.y = 0
		gripping = true
		if velocity.x > 0:
			touching = false
			velocity.y += gravity*delta
	else:
		gripping = false
	
	if stairMovement == true:
		if Input.is_action_just_pressed("moveUp") or Input.is_action_just_pressed("moveDown"):
			position = stairDestination
			stairMovement = true
	if Input.is_action_pressed("crouch"):
		sprite.texture = crouching
	else:
		pass

func jump():
	pass
