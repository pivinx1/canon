extends Node

var rng = RandomNumberGenerator.new()

var currentSector: String = "reversetower"

var emailDict = {
	"test": {
		"sender": "Eosphorous",
		"subject": "Test message",
		"content": "Good day,\n This is a test message.\n You may disregard it.",
		"attachments": {},
		"isRead": false
	},
	"anothertest": {
		"sender": "Hesperus",
		"subject": "Another test message",
		"content": "Good day,\n This is another message. Eosphorous told me to send it to you, so here you are.\n You may disregard it.",
		"attachments": {},
		"isRead": false
	}
}

var connectionDict: Dictionary = {
	"hostname": "RSM_AGENT_FFFFFFFF",
	"address": "FF:FF:00:00:FF:FF",
	"ports": [21, 22, 121, 389]
}

const musicDict: Dictionary = {
	"postCreation": "res://sounds/bgm/SecondThoughts.ogg",
	"firstmission": "res://sounds/bgm/ForensicLab.ogg",
}

const sectorPrefixes: Dictionary = {
	"rossum": "RSM",
	"cyclopes": "CYL",
	"helios": "HEL",
	"enigma": "ENI",
	"pierides": "PIE",
	"burbank": "BUR",
	"copley": "COP",
	"ascension": "ASC",
	"reversetower": "RTOWER",
}

const miscAgentNamingParts: Dictionary = {
	"generic": "AGENT",
	"admin": "ADMIN",
	"trader": "DCT",
	"sanctifier": "SANCT",
}

const macAddressArray: Array[String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]

func _ready():
	rng.randomize()

func generateAgent(sector: String, type: String):
	var agentMacArray: Array[String] = ["", "", "", "", "", ""]
	var fullAgentNamePlaceholder = "{sector}_{type}_{id}"
	var agentId: String
	for octet in agentMacArray.size():
		for i in 2:
			agentMacArray[octet] += macAddressArray[rng.randi_range(0, 15)]
			print(octet)
	print(agentMacArray)
	var agentMacAddress: String = "%s:%s:%s:%s:%s:%s"
	agentMacAddress = agentMacAddress % [agentMacArray[0], agentMacArray[1], agentMacArray[2], agentMacArray[3], agentMacArray[4], agentMacArray[5]]
	for i in 6:
		agentId += macAddressArray[rng.randi_range(0, 15)]
	var fullAgentName: String = fullAgentNamePlaceholder.format({"sector": sectorPrefixes[sector], "type": miscAgentNamingParts[type], "id": agentId})
	return [fullAgentName, agentMacAddress]
	
