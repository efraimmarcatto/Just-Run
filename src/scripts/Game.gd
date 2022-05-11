extends CanvasLayer

var connected: Array

func _process(delta):
	for enemy in $World/Enemys.get_children():
		if not enemy.name in connected:
			enemy.connect('enemy_dead', self, 'add_point')
			connected.append(enemy.name)

	$GameInterface/Points.bbcode_text = '[center][b]' +str($Player.score) + '[/b][/center]'


func _ready():
	if OS.get_name() == 'Android':
		$GameInterface/Help.visible = false
		$GameInterface/MobileButtons.visible = true
	else:
		$GameInterface/Help.visible = true
		$GameInterface/MobileButtons.visible = false


func add_point(pontos=1, name=null):
	connected.erase(name)
	if $Player.score >= 100:
		$World.enemy_timer = 2
	if $Player.score >= 200:
		$World.enemy_timer = 1
	$Player.score += pontos


func _on_PointTimer_timeout():
	add_point()


func _on_Helptimer_timeout():
	$GameInterface/Help.visible = false
	$GameInterface/Help/Helptimer.stop()


func exit():
	get_tree().change_scene("res://scenes/interface/Start.tscn")

