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
		entry_field.text = ""
