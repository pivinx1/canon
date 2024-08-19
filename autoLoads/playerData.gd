extends Node

var files = globaldata.files

var playerInfoDict: Dictionary = {
	"playerName": "",
	"playerGender": "",
	"playerMac": "",
	"playerHostname": "",
}

var playerPorts: Dictionary = {
	"22": "filtered",
	"69": "filtered", 
	"25": "open",
	"337": "filtered"
}

var playerStats: Dictionary = {
	"operandPool": 50,
	"operandUsage": 0,
	"ramPool": 768,	#	1 MqB
	"ramUsage": 0
}

var playerFs: Dictionary = {
	"home": {
		
	},
	"var": {
		"log": {
			
		}
	},
	"bin": {
		
	},
	"sbin": {
		"ctOS_4.6.1_R2_SCALE.elf.gz": files["ctos_sanctifier"]["content"],
		"networkd": {
			"netdrv.sys": files["sanctifier_netdrv"]["content"],
			"eno0.cfg": "hwaddr: %s\ndriver: virtio-net"
		}
	}
}
