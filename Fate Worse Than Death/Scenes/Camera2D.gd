extends Camera2D
onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	position = player.position
