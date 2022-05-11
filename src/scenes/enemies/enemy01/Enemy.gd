extends KinematicBody2D
signal enemy_dead(amount)

export var fly_speed = 50
onready var motion: Vector2
var bullet = preload("res://scenes/player/Bullet.tscn")
var normal_direction = true
var start_position = Vector2( 626, 242)
var entrance = true

func _ready():
	randomize()
	$ShooterTimer.start(1)


func _physics_process(delta):
	if entrance and global_position != start_position:

			global_position = global_position.linear_interpolate(start_position, delta * 10.1)
			if global_position.x - start_position.x <= 1 and global_position.y - start_position.y <= 1:
				entrance = false
	else:
		if normal_direction:
			motion = Vector2(0, fly_speed * -1)
			if position.y <= 10:
				normal_direction = false
		else:
			motion = Vector2(0, fly_speed)
			if position.y >= 330:
				normal_direction = true

		motion = move_and_slide(motion)


func _on_ShooterTimer_timeout():
	shoot()
	$ShooterTimer.start(rand_range(0, 2))


func shoot():
	var shoot = bullet.instance()
	shoot.direction = 1
	shoot.enemy_fire = true
	shoot.global_position = $ShotPosition.global_position
	get_parent().get_parent().add_child(shoot)


func _on_HitArea_body_entered(body):

	if 'projectiles' in body.get_groups() and !body.enemy_fire:
		emit_signal("enemy_dead", 5, name)
		body.queue_free()
		queue_free()


