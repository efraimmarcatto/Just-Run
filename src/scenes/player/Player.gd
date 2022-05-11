extends KinematicBody2D

const UP = Vector2(0,-1)
const JUMP_FORCE = 300
const MAXFALLSPEED = 300
const GRAVITY = 15

var grounded: bool = false
var screams = [
	load("res://assets/sounds/sfx/scream01.wav"),
	load("res://assets/sounds/sfx/scream02.wav"),
	load("res://assets/sounds/sfx/scream03.wav"),
	load("res://assets/sounds/sfx/scream04.wav")
]

var motion:Vector2
var score: int = 0
var jumps: int
var bullet = preload("res://scenes/player/Bullet.tscn")
var life: int = 3


func _physics_process(delta):

	if $RayCast.is_colliding():
		grounded = true
		jumps = 1
		if position.y >= 299 and position.x < 120:
			position.x += 10

	else:
		grounded = false

	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if Input.is_action_just_pressed('fire'):
		var shot = bullet.instance()
		shot.position = $ShotPosition.global_position
		get_parent().add_child(shot)

	if Input.is_action_just_pressed('jump') and jumps <= 2:
		motion.y = -JUMP_FORCE
		jumps += 1
		$AnimatedSprite.play('jump')

	if grounded:
		$AnimatedSprite.play('run')

	if not grounded:
		$AnimatedSprite.play('fall')


	motion = move_and_slide(Vector2(0, motion.y), UP)


func _on_HitArea_body_entered(body):
	if 'projectiles' in body.get_groups() and body.enemy_fire:
		$AudioStreamPlayer.stream = screams[int(rand_range(1,4))]
		$AudioStreamPlayer.play()
		life -= 1
		get_parent().get_node("GameInterface/LifeBar").update_lifebar(life)
		if life <= 0:
			PauseScene.player_points = score
			get_tree().change_scene("res://scenes/interface/GameOver.tscn")


