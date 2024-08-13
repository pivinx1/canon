extends Control

@export var entry_field: LineEdit
@export var echo_box: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_entry_field_text_submitted(new_text):
	var command: String = "> " + new_text
	echo(command)
	handleCommand(new_text)
	entry_field.text = ""

func echo(str: String):
	echo_box.text += str("\n" + str)

func handleCommand(command: String):
	var slicedCommand: PackedStringArray = command.rsplit(" ")
	print([slicedCommand])
	match slicedCommand[0]:
		"roundup":
			var agentArray: Array = globaldata.generateAgent(globaldata.currentSector, "generic")
			globaldata.connectionDict["hostname"] = agentArray[0]
			globaldata.connectionDict["address"] = agentArray[1]
			agentregistry.registerAgent("agent", agentArray[0], agentArray[1])
			echo("Found Agent " + agentArray[0] + " with address " + agentArray[1])
		"connect": 
			var targetMac: String = slicedCommand[1]
			if targetMac == playerdata.playerInfoDict["playerMac"] or targetMac == "00:00:00:00:00:00":
				var connection = globaldata.connectionDict
				connection["hostname"] = playerdata.playerInfoDict["playerHostname"]
				connection["address"] = playerdata.playerInfoDict["playerMac"]
				connection["filesystem"] = playerdata.playerFs
			else:
				if agentregistry.agentRegistry.has(targetMac):
					var connection = globaldata.connectionDict
					connection["hostname"] = agentregistry.agentRegistry[targetMac]["hostname"]
					connection["address"] = targetMac
					connection["filesystem"] = agentregistry.agentRegistry[targetMac]["filesystem"]
				else:
					echo("Failed to connect: Could not find host at " + targetMac)
		_:
			echo("No such command " + command + " - Check syntax and retry.")
