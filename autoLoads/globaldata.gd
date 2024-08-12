extends Node

var rng = RandomNumberGenerator.new()

const musicDict: Dictionary = {
	"postCreation": "res://sounds/bgm/SecondThoughts.ogg",
	"firstmission": "res://sounds/bgm/ForensicLab.ogg",
}

var connectionDict: Dictionary = {
	"hostname": "RSM_AGENT_FFFFFFFF",
	"address": "FF:FF:00:00:FF:FF",
	"ports": [21, 22, 121, 389]
}

var sectorPrefixes: Dictionary = {
	"rossum": "RSM",
	"cyclopes": "CYL",
	"helios": "HEL",
	"enigma": "ENI",
	"pierides": "PIE",
	"burbank": "BUR",
	"copley": "COP",
	"ascension": "ASC",
}

var miscAgentNamingParts: Dictionary = {
	"admin": "ADMIN",
	"trader": "DCT",
	"sanctifier": "SANCT",
}

var macAddressArray: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

func _ready():
	rng.randomize()

func generateAgent(sector: String):
	var agentMacArray: Array[String] = ["", "", "", "", "", ""]
	var agentId: String
	for octet in agentMacArray:
		for i in 2:
			octet += rng.randi_range(0, 15)
	
