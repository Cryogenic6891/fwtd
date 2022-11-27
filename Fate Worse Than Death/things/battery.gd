extends Sprite

onready var player = get_tree().get_nodes_in_group("player")[0]

func _on_Area2D_body_entered(body):
	if body == player:
		player.flashlight.battery = 100
		print(player.flashlight.battery)
		queue_free()
