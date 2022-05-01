extends Node2D

var platform = preload("res://scenes/world/Platform.tscn")

func _physics_process(delta):
	pass
	

func _ready():
	randomize()


func _on_DeathZone_body_entered(body):
	if body.name == 'Player':
		get_tree().change_scene("res://Game.tscn")


func _on_SpawnTime_timeout():
	if int(rand_range(1, 2)) == 1:
		var spawned = platform.instance()
		spawned.global_position.y = rand_range(60, 320)
		spawned.global_position.x = 660
		$Platforms.add_child(spawned)
