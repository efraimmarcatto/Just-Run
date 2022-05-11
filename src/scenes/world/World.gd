extends Node2D

var platform = preload("res://scenes/world/Platform.tscn")
var enemy01 = preload("res://scenes/enemies/enemy01/Enemy.tscn")
var enemy_timer: int = 3


func _ready():
	randomize()
	$SpawnEnemy01.start(enemy_timer)


func exit():
	get_tree().change_scene("res://scenes/interface/Start.gd")


func _on_DeathZone_body_entered(body):
	if body.name == 'Player':
		PauseScene.player_points = body.score
		get_tree().change_scene("res://scenes/interface/GameOver.tscn")


func _on_SpawnTime_timeout():
	if int(rand_range(1, 2)) == 1:
		var spawned = platform.instance()
		spawned.position.y = rand_range(60, 320)
		spawned.position.x = 660
		$Platforms.add_child(spawned)


func _on_SpawnEnemy01_timeout():
	if randi() % 2 == 1:
		var enemy = enemy01.instance()
		enemy.global_position = Vector2(720,200)
		enemy.start_position = Vector2(int(rand_range(350,620)), int(rand_range(30, 330)))
		enemy.scale = Vector2(2,2)
		if enemy_timer < 3:
			enemy.fly_speed = int(rand_range(50, 200))
		$Enemys.add_child(enemy)

