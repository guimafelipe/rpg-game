extends KinematicBody2D

enum State {IDLE, INTERACTING, CUTSCENE}

var vectors : Dictionary =  {
		"up": Vector2(0, -1),
		"down": Vector2(0, 1),
		"left": Vector2(-1, 0),
		"right": Vector2(1, 0)
	}

export var speed = Global.BLOCK_SIZE*4

var held_directions : Array = []
var state = State.CUTSCENE
var direction : String = "down"
var target : InteractableObject = null

onready var raycast : RayCast2D = $RayCast2D


func _update_raycast():
	match direction:
		"down":
			raycast.rotation_degrees = 0
		"left":
			raycast.rotation_degrees = 90
		"up":
			raycast.rotation_degrees = 180
		"right":
			raycast.rotation_degrees = -90


func _get_direction():
	if state != State.IDLE:
		return
	for dir in ["left", "right", "up", "down"]:
		var is_pressed = Input.is_action_pressed("ui_"+dir)
		var index_of_direction = held_directions.find(dir)
		if index_of_direction == -1:
			if is_pressed:
				held_directions.push_front(dir)
		else:
			if not is_pressed:
				held_directions.remove(index_of_direction)
	
	if held_directions.size() > 0:
		return held_directions[0]
	else: 
		return null


func _clear_target():
	if target:
		# target.disconnect("finished_interaction", self, "_on_finished_interacting")
		target.remove_focus()
		target = null


func _check_raycast():
	var obj = raycast.get_collider()
	
	if not obj:
		_clear_target()
		return
	
	if obj.get_parent() is InteractableObject:
		if obj.get_parent() == target:
			return
		_clear_target()
		target = obj.get_parent()
		# target.connect("finished_interaction", self, "_on_finished_interacting")
		target.focus()


func _check_interact():
	if state != State.IDLE:
		return
	if Input.is_action_just_pressed("ui_accept") and target:
		target.interact()
		#state = State.INTERACTING


func _physics_process(_delta):
	var dir = _get_direction()
	if dir:
		direction = dir
		_update_raycast()
		move_and_slide(vectors[dir]*speed)
	_check_raycast()
	_check_interact()


func _ready():
	state = State.IDLE
	var dialogue_box = get_parent().get_node("DialogueBox")
	if dialogue_box:
		dialogue_box.connect("dialogue_started", self, "_on_started_dialogue")
		dialogue_box.connect("dialogue_finished", self, "_on_finished_dialogue")
	var inventory_window = get_parent().get_node("InventoryWindow")
	if inventory_window:
		inventory_window.connect("inventory_opened", self, "_on_inventory_opened")
		inventory_window.connect("inventory_closed", self, "_on_inventory_closed")

func _on_started_dialogue():
	state = State.INTERACTING

func _on_finished_dialogue():
	state = State.IDLE

func _on_finished_interacting():
	state = State.IDLE

func _on_inventory_opened():
	state = State.INTERACTING

func _on_inventory_closed():
	state = State.IDLE
