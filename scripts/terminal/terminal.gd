extends Control

@export var entry_field: LineEdit
@export var echo_box: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_ENTER):
		var command: String = "\n> " + entry_field.text 
		echo_box.text += command
		handleCommand(entry_field.text)
		entry_field.text = ""

func handleCommand(command: String):
	match command:
		"roundup":
			globaldata.generateAgent(globaldata.currentSector)
		_:
			pass
