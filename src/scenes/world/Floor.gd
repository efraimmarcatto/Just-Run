extends StaticBody2D

func _physics_process(delta):
	if position.x == -640:
		position.x = 640
	position.x -= 4
