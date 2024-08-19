extends Node

var rng = RandomNumberGenerator.new()

var fileRegistry: String = "res://staticData/files.json"
var portRegistry: String = "res://staticData/services.json"
var hardAgentRegistry: String = "res://staticData/predefinedNodes.json"
var programRegistry: String = "res://staticData/programs.json"
var files: Dictionary = loadFiles()

var currentSector: String = "reversetower"

var emailDict = {
	"intro": {
		"sender": "Eosphorous",
		"subject": "Welcome",
		"content": """
		Welcome, new Sanctifier.\n
		I am Eosphorous, and as a Sanctifier and their leader, my task is to maintain stability throughout Magrasea.\n
		As a Sanctifier, Greater or not, your job is to keep the sector clean of Irregular Agents, and as of recently, Entropics. However,
		the Entropic menace is currently being dealt with by one of your fellow Sanctifiers, Hesperus, so that is not relevant for now.\n
		As a form of training, my first order for you is to head to the Rossum sector.\n
		Do as I said and return to me once you are ready to continue.
		""",
		"attachments": {},
		"objectives": {
			"connect_toSector": "rossum"
		},
		"nextmission": "firstmission",
		"isRead": false
	}
}

var connectionDict: Dictionary = {
}

const musicDict: Dictionary = {
	"postCreation": "res://sounds/bgm/SecondThoughts.ogg",
	"firstmission": "res://sounds/bgm/ForensicLab.ogg",
}

var portColorDict: Dictionary = {
	"unknown": Color.hex(0xaaaaaaff),
	"open": Color.hex(0x6ec347ff),
	"closed": Color.hex(0xf80028ff),
	"filtered": Color.hex(0xa28100ff),
	"entropized": Color.hex(0xc512c6ff)
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
	var agentMacAddress = generateMacAddr()
	var fullAgentName = generateHostname(sector)
	return [fullAgentName, agentMacAddress]

func generateMacAddr():
	var macArray: Array[String] = ["", "", "", "", "", ""]
	for octet in macArray.size():
		for i in 2:
			macArray[octet] += macAddressArray[rng.randi_range(0, 15)]
	var macAddress: String = "%s:%s:%s:%s:%s:%s"
	macAddress = macAddress % [macArray[0], macArray[1], macArray[2], macArray[3], macArray[4], macArray[5]]
	return macAddress

func generateHostname(sector: String, agentType: String = "generic", agentName: String = ""):
	if agentName == "":
		const fullAgentNamePlaceholder = "{sector}_{type}_{id}"
		var agentId: String = ""
		for i in 6:
			agentId += macAddressArray[rng.randi_range(0, 15)]
		var fullAgentName: String = fullAgentNamePlaceholder.format({"sector": sectorPrefixes[sector], "type": miscAgentNamingParts[agentType], "id": agentId})
		return fullAgentName
	else:
		match agentType:
			"sanctifier":
				const fullAgentNamePlaceholder = "{type}_{name}"
				return fullAgentNamePlaceholder.format({"type": miscAgentNamingParts[agentType], "name": agentName})
			"admin":
				const fullAgentNamePlaceholder = "{sector}_{type}_{name}"
				return fullAgentNamePlaceholder.format({"type": miscAgentNamingParts[agentType],
														"name": agentName,
														"sector": sectorPrefixes[sector]})
			"trader":
				const fullAgentNamePlaceholder = "{type}_{name}"
				return fullAgentNamePlaceholder.format({"type": miscAgentNamingParts[agentType], "name": agentName})
				
func loadJSON(path: String):
	if FileAccess.file_exists(path):
		var dataFile = FileAccess.open(path, FileAccess.READ)
		
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error reading file")
	else:
		print("File doesn't exist")
		
func loadFiles():
	return loadJSON(fileRegistry)

func loadPorts():
	return loadJSON(portRegistry)

func loadHardAgents():
	return loadJSON(hardAgentRegistry)

func loadPrograms():
	return loadJSON(programRegistry)
