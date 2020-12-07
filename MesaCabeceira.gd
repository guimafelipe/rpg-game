extends InteractableObject

func interact():
	print("sou uma mesa")
	yield(get_tree().create_timer(3.0), "timeout")
	emit_signal("finished_interaction")
