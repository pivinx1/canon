extends Control

var services: Dictionary = globaldata.loadPorts()
var portStateColors: Dictionary = globaldata.portColorDict
@onready var portEntry: PackedScene = preload("res://prefab/port.tscn")
@onready var portContainer: VBoxContainer = $ScrollContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var conPorts = globaldata.connectionDict["ports"]
	for port in conPorts:
		var entry: ColorRect = portEntry.instantiate()
		var num: Label = entry.get_child(0)
		var status: Label = entry.get_child(1)
		var srvName: Label = entry.get_child(2)
		portContainer.add_child(entry)
		portContainer.add_spacer(false)
		entry.name = str(port)
		entry.color = portStateColors[conPorts[port]]
		num.set_text(str(port))
		status.set_text(conPorts[port])
		srvName.set_text(services[str(port)])
