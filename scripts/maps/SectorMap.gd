extends Panel

@onready var nodecircle: PackedScene = preload("res://prefab/sectorNode.tscn")
@onready var nodegrid: GridContainer = $GridContainer
const tooltipPrefab: String = "{hostname}\n{address}"

# Called when the node enters the scene tree for the first time.
func _ready():
	_refreshMap()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _refreshMap():
	for node in nodegrid.get_children():
		node.queue_free()
	for agent in agentregistry.agentRegistry:
		if agentregistry.agentRegistry[agent]["sector"] != globaldata.currentSector:
			pass
		else:
			var node: Node = nodecircle.instantiate()
			nodegrid.add_child(node)
			node.name = agent.replace("_", ":")
			node.tooltip_text = tooltipPrefab.format({"hostname": agentregistry.agentRegistry[agent]["hostname"], 
												 "address": agent})
			node.connect("pressed", _connectTo.bind(node.name))

func _connectTo(addr: String):
	var connection = globaldata.connectionDict
	connection["hostname"] = agentregistry.agentRegistry[addr.replace("_", ":")]["hostname"]
	connection["address"] = addr.replace("_", ":")
	connection["filesystem"] = agentregistry.agentRegistry[addr.replace("_", ":")]["filesystem"]
	connection["ports"] = {}
	for port in agentregistry.agentRegistry[addr.replace("_", ":")]["ports"]:
		connection["ports"][port] = "unknown"


func _on_monitor_view_refresh_map():
	_refreshMap()


func _on_server_map_refresh_sector():
	_refreshMap()
