extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready():
	inventory.connect("items_changed", self, "_on_items_changed")
	update_inventory_display()

func update_inventory_slot_display(i : int):
	var slot = get_child(i)
	var item = inventory.items[i]
	slot.display_item(item)

func update_inventory_display():
	var items = inventory.items
	var n = items.size()
	for i in range(n):
		update_inventory_slot_display(i)
	for i in range(n, get_child_count()):
		var slot = get_child(i)
		slot.display_item(null)

func _on_items_changed():
	update_inventory_display()
