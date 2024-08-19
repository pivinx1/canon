extends Control

signal openFsWindow
signal probe

var connectionDetails: Dictionary

@export var probeButton: Button
@export var filesystemButton: Button
@export var disconnectButton: Button

@export var addressField: Label
@export var hostnameField: Label
@export var menuNode: Control
@export var noConnPanel: Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	if globaldata.connectionDict != {}:
		menuNode.show()
		noConnPanel.hide()
		connectionDetails = globaldata.connectionDict
		addressField.text = connectionDetails["address"]
		hostnameField.text = connectionDetails["hostname"]
		if agentregistry.agentRegistry[connectionDetails["address"]]["ports"]["69"] == "closed":
			filesystemButton.disabled = true
	else:
		noConnPanel.show()

func _disconnect():
	globaldata.connectionDict = {}
	menuNode.hide()
	noConnPanel.show()

func _on_filesystem_pressed():
	openFsWindow.emit()


func _on_probe_pressed():
	probe.emit()
