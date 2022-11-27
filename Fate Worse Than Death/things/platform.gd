extends Line2D

export var spinning = false
export var rotateSpeed = 0.01


func _physics_process(delta):
	if spinning == true:
		rotation += rotateSpeed
