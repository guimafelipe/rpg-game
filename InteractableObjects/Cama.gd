extends InteractableObject

var inventory = preload("res://UI/Inventory/Inventory.tres")
var gatoitem = preload("res://Items/Gato.tres")

func interact():
	print("sou uma cama")
	dialogue_box.start_dialogue("cama_teste")
	yield(dialogue_box, "dialogue_finished")
	inventory.remove_item(gatoitem.name)
