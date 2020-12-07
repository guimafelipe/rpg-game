extends CenterContainer

onready var itemTextureRect = $ItemTextureRect

func display_item(item):
	if item is Item:
		itemTextureRect.texture = item.texture
		show()
	else:
		itemTextureRect = null
		hide()
