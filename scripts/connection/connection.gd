extends Control

signal openFsWindow
signal probe

var connectionDetails: Dictionary

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
	else:
		noConnPanel.show()


func _on_filesystem_pressed():
	openFsWindow.emit()


func _on_probe_pressed():
	probe.emit()
