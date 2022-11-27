extends Line2D

onready var bottom = $bottomStair
onready var top = $topStair

onready var player = get_tree().get_nodes_in_group("player")[0]


onready var topStair = $topStair/Position2D
onready var bottomStair = $bottomStair/Position2D


func _on_bottomStair_body_exited(body):
	if body == player:
		player.stairMovement = false
#		player.goingUp = false



func _on_bottomStair_body_entered(body):
	if body == player:
		player.stairMovement = true
#		player.goingUp = true
		player.stairDestination = topStair.global_position




func _on_topStair_body_entered(body):
	if body == player:
		player.stairMovement = true
#		player.goingUp = false
		player.stairDestination = bottomStair.global_position

func _on_topStair_body_exited(body):
	if body == player:
		player.stairMovement = false
#		player.goingUp = false

