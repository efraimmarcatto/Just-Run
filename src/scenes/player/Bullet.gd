extends RigidBody2D

var direction = 0
var enemy_fire = false


func _ready():
	if direction != 0:
		$Sprite.flip_h = true


func _physics_process(delta):
	if direction == 0:
		position.x += 250 * delta
	else:
		position.x -= 300 * delta
	if position.x <= -10 or position.x >= 700:
		queue_free()


func _on_Bullet_body_entered(body):
	queue_free()

