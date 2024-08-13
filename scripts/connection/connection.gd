extends Control

signal openFsWindow

var connectionDetails: Dictionary

@export var addressField: Label
@export var hostnameField: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	connectionDetails = globaldata.connectionDict
	addressField.text = connectionDetails["address"]
	hostnameField.text = connectionDetails["hostname"]



func _on_filesystem_pressed():
	openFsWindow.emit()
