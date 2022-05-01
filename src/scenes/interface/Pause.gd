extends CanvasLayer

func _ready():
	set_visibility(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visibility(!get_tree().paused)
		get_tree().paused = !get_tree().paused

func set_visibility(is_visible: bool):
	for node in get_children():
		node.visible = is_visible

func _on_Continue_pressed():
	set_visibility(false)
	get_tree().paused = false
