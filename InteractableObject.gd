class_name InteractableObject
extends Node2D

signal finished_interaction(obj)

export(Texture) var sprite setget set_sprite

func focus():
	print("to focado")
	print(name)

func remove_focus():
	print("saí do foco")
	print(name)

func interact():
	# override this funcion in children classes
	pass

func set_sprite(_sprite):
	$Sprite.texture = _sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
