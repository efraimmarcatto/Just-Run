extends RigidBody2D

func _physics_process(delta):
	position.x += 250 * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Bullet_body_entered(body):
	queue_free()
	
