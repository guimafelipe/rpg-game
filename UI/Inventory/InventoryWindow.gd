class_name InventoryWindow
extends Control

signal inventory_closed
signal inventory_opened

var dialogue_box

func set_dialogue_box(_dialogue_box):
	dialogue_box = _dialogue_box

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if visible:
			hide()
			emit_signal("inventory_closed")
		elif dialogue_box and not dialogue_box.visible:
			$TextureRect/InventoryDisplay.update_inventory_display()
			show()
			emit_signal("inventory_opened")
