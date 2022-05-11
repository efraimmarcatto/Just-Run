extends HBoxContainer


func update_lifebar(life):
	for i in get_child_count():
		if i < life:
			get_child(i).show()
		else:
			get_child(i).hide()

