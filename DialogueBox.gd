extends Control

signal dialogue_started
signal dialogue_finished

var dialogue : Dictionary
var conversation : Array
var ind : int
var can_go = false

onready var textbox = $RichTextLabel
onready var tween = $Tween

func finish_conversation():
	emit_signal("dialogue_finished")
	hide()


func go_next():
	if ind == conversation.size():
		finish_conversation()
		return
	can_go = false
	textbox.bbcode_text = conversation[ind].text
	textbox.percent_visible = 0
	tween.interpolate_property(
		textbox, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	ind += 1


func start_dialogue(dialogue_id : String):
	dialogue = _load_dialogue(dialogue_id)
	conversation = dialogue.values()
	print("conversation: ")
	print(conversation)
	ind = 0
	show()
	emit_signal("dialogue_started")
	go_next()


func _load_dialogue(dialogue_id) -> Dictionary:
	var file = File.new()
	var file_path = "res://Dialogues/" + dialogue_id + ".json"
	assert(file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and can_go:
		go_next()


func _on_Tween_tween_completed(object, key):
	can_go = true
