extends Control

@export var entry_field: LineEdit
@export var echo_box: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_key_pressed(KEY_ENTER):
		var command: String = "> " + entry_field.text 
		echo(command)
		handleCommand(entry_field.text)
		entry_field.text = ""

func echo(str: String):
	echo_box.text += str("\n" + str)

func handleCommand(command: String):
	match command:
		"roundup":
			var agentArray: Array = globaldata.generateAgent(globaldata.currentSector, "generic")
			globaldata.connectionDict["hostname"] = agentArray[0]
			globaldata.connectionDict["address"] = agentArray[1]
			echo("Found Agent " + agentArray[0] + " with address " + agentArray[1])
		_:
			echo("No such command " + command + " - Check syntax and retry.")
