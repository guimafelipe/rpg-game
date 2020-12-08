extends Control

signal inventory_closed
signal inventory_opened

onready var dialogue_box = get_parent().get_node("DialogueBox")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if visible:
			hide()
			emit_signal("inventory_closed")
		elif not dialogue_box.visible:
			$TextureRect/InventoryDisplay.update_inventory_display()
			show()
			emit_signal("inventory_opened")
