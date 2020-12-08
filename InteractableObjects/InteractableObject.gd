class_name InteractableObject
extends Node2D

signal finished_interaction(obj)

export(Texture) var sprite setget set_sprite

onready var dialogue_box = get_parent().get_node("DialogueBox")

func focus():
	print("to focado")
	print(name)

func remove_focus():
	print("saí do foco")
	print(name)
	emit_signal("finished_interaction")

func interact():
	# override this funcion in children classes
	pass

func set_sprite(_sprite):
	$Sprite.texture = _sprite
