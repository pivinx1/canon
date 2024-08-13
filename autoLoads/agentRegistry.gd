extends Node

var files = globaldata.loadFiles()

var agentRegistry: Dictionary = {
	
}

var agentRegistryEntryPrefab = {
	"hostname": "HOSTNAME",
	"ports": [],
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
	"ports": [],
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

func registerAgent(type: String, hostname: String, address: String, ports: Array[int] = [22, 21, 121]):
	match type:
		"agent":
			var entry = agentRegistryEntryPrefab
			entry["hostname"] = hostname
			entry["ports"] = ports
			agentRegistry[address] = entry
		"sanctifier":
			var entry = sanctifierRegistryEntryPrefab
			entry["hostname"] = hostname
			entry["ports"] = ports
			agentRegistry[address] = entry
