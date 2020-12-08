extends InteractableObject

var inventory = preload("res://UI/Inventory/Inventory.tres")
var gatoitem = preload("res://Items/Gato.tres")

func interact():
	dialogue_box.start_dialogue("cama_teste")
	yield(dialogue_box, "dialogue_finished")
	inventory.add_item(gatoitem)
	# emit_signal("finished_interaction")
