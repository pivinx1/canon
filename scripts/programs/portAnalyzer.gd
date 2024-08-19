extends Control

signal programQuit

var currentConnection = globaldata.connectionDict
var agentRegistry = agentregistry.agentRegistry
var portAnalyzerDict = globaldata.loadPrograms()["portanalyzer"]


# Called when the node enters the scene tree for the first time.
func _ready():
	playerdata.playerStats["ramUsage"] += portAnalyzerDict["ramUsage"]
	playerdata.playerStats["operandUsage"] += portAnalyzerDict["operandUsage"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
		currentConnection["ports"] = agentRegistry[currentConnection["address"]]["ports"]
		programQuit.emit()
