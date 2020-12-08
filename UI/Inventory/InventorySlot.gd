class_name InventorySlot
extends CenterContainer

onready var itemTextureRect = $ItemTextureRect

var item = null

func display_item(_item):
	if _item is Item:
		item = _item
		itemTextureRect.texture = item.texture
		show()
	else:
		itemTextureRect.texture = null
		item = null
		hide()


func _on_InventorySlot_focus_entered():
	$ColorRect.show()


func _on_InventorySlot_focus_exited():
	$ColorRect.hide()
