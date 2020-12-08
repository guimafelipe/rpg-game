extends RichTextLabel

func _process(delta):
	var focus_owner = get_parent().get_focus_owner()
	if focus_owner is InventorySlot:
		bbcode_text = focus_owner.item.description
	else:
		bbcode_text = ""
