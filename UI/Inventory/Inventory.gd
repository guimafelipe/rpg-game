class_name Inventory
extends Resource

signal items_changed

export(Array, Resource) var items = []

static func items_comp(a : Item, b: Item):
	return a.name < b.name

func add_item(item : Item):
	items.append(item)
	items.sort_custom(self, "items_comp")
	emit_signal("items_changed")

func remove_item(_item_name : String):
	pass

