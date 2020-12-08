class_name GameScene
extends Node2D

onready var world : Node2D = $World
onready var dialogue_box : DialogueBox = $DialogueBox
onready var inventory_window : InventoryWindow = $InventoryWindow
onready var luiz : Luiz = $World/Luiz


func _ready():
	luiz.set_dialogue_box(dialogue_box)
	luiz.set_inventory_window(inventory_window)
	inventory_window.set_dialogue_box(dialogue_box)

