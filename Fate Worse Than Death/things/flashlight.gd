extends KinematicBody2D


var RNG = RandomNumberGenerator.new()

onready var enemy = get_tree().get_nodes_in_group("enemy")[0]
onready var light = $Light2D/Area2D
onready var switchLight = $Light2D
onready var batteryTimer = $Timer

var battery = 100
var rotationLook = Vector2.ZERO

		
		

func _physics_process(delta):
	look_at(get_global_mouse_position())
	RNG.randomize()
	var randomNumber = RNG.randi_range(1,100)
	if randomNumber > battery and battery < 25:
		light.monitoring = false
		switchLight.color = Color.black
	else:
		light.monitoring = true
		switchLight.color = Color.white

func _on_Area2D_body_entered(body):
	if body == enemy:
		enemy.lit = true




func _on_Area2D_body_exited(body):
	if body == enemy:
		enemy.lit = false



func _on_Timer_timeout():
	battery -= 4
