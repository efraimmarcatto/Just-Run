extends StaticBody2D


func _physics_process(delta):
	position.x -= 4
	if position.x <= -672:
		queue_free()
