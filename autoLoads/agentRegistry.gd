extends Node

var files = globaldata.loadFiles()
var hardAgents = globaldata.loadHardAgents()

var agentRegistry: Dictionary = {
	
}

var agentRegistryEntryPrefab = {
	"hostname": "HOSTNAME",
	"ports": {
		"22": "open",
		"69": "open",
		"121": "open"
	},
	"filesystem": {
			"home": {
				
			},
			"var": {
				"log": {
					
				}
			},
			"bin": {
				
			},
			"sbin": {
				"ctOS_4.5.7_CORE.gz": files["ctos_agent"]["content"]
			}
	}
}

var sanctifierRegistryEntryPrefab = {
	"hostname": "HOSTNAME",
	"ports": {
		"22": "filtered", 
		"25": "open", 
		"69": "filtered", 
		"337": "filtered"
		},
	"filesystem": {
			"home": {
				
			},
			"var": {
				"log": {
					
				}
			},
			"bin": {
				
			},
			"sbin": {
				"ctOS_4.6.1_R2_SCALE.gz": files["ctos_sanctifier"]["content"]
			}
	}
}

func registerAgent(type: String, hostname: String, address: String, ports: Dictionary = {22: "open", 69: "open", 121: "open"}):
	match type:
		"sanctifier":
			var entry = sanctifierRegistryEntryPrefab.duplicate()
			entry["hostname"] = hostname
			entry["ports"] = ports
			agentRegistry[address] = entry
		_:
			var entry = agentRegistryEntryPrefab.duplicate()
			entry["hostname"] = hostname
			entry["ports"] = ports
			agentRegistry[address] = entry
