class_name Cutscene
extends Node

onready var inventory_window = get_parent().get_node("InventoryWindow")
onready var dialogue_box = get_parent().get_node("DialogueBox")

func finish():
	inventory_window.set_in_cutscene(false)
	dialogue_box.set_in_cutscene(false)

func start():
	inventory_window.set_in_cutscene(true)
	#dialogue_box.set_in_cutscene(false)

# virtual function
func execute():
	pass
