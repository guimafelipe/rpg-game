extends InteractableObject

func interact():
	print("sou uma cama")
	yield(get_tree().create_timer(5.0), "timeout")
	emit_signal("finished_interaction")
