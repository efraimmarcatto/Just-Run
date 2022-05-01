extends Camera2D

func _process(delta):
	offset = offset + Vector2(1 ,0) * 40 * delta
