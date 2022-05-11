extends Control


func _ready():
	$MarginContainer/VBoxContainer/Points.text = 'Points: ' + str(PauseScene.player_points)


func _on_Restart_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Exit_pressed():
	get_tree().change_scene("res://scenes/interface/Start.tscn")

