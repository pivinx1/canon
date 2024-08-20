extends Node

var missions: Dictionary = {
    "intro": {
		"sender": "Eosphorous",
		"subject": "Welcome",
		"content": """
		Welcome, new Sanctifier.\n
		I am Eosphorous, and as a Sanctifier and their leader, my task is to maintain stability throughout Magrasea.\n
		As a Sanctifier, Greater or not, your job is to keep the sector clean of Irregular Agents, and as of recently, Entropics. However,
		the Entropic menace is currently being dealt with by one of your fellow Sanctifiers, Hesperus, so that is not relevant for now.\n
		As a form of training, my first order for you is to head to the Rossum sector by using your Server Map. 
		I have attached a link to the sector to this message, you can access it using the Attachments button.\n
		Do as I said and return to me once you are ready to continue.
		""",
		"attachments": {
			"ROSSUM_SECTOR": {
				"type": "sectorlink",
				"content": "rossum"
			}
		},
		"objectives": {
			"connect_toSector": "rossum"
		},
		"nextmission": "firstmission",
		"isRead": false
	},
    "training": {
        "sender": "Eosphorous",
		"subject": "Training",
		"content": """
		Excellent work. A Sanctifier of your caliber should have been able to do that easily, and I am not disappointed.\n
		Anyways, I have set up a target Agent for you inside the sector, while you were there, and left a file in it's /home directory.
		As a test, you must find it by scanning the sector in search of it
		Download it, and return to me.
		""",
		"attachments": {
			"ctOS Recon Guide": {
				"type": "note",
				"content": """
					Reconnaissance on a sector always relies on the "scan" command available in the Terminal,
					which allows you to find up to 5 Agents or Sanctifiers present in a sector.
					Upon finding the desired Agent you would like to connect to, use the "connect" command,
					followed by the target's address, i.e. "connect 2A:3F:00:CC:19:84". Do note that addresses are case insensitive.
					Finally, in order to discover the target's currently visible ports, run the probe command. Do note, however,
					that due to potential changes in the statuses in various circumstances, everytime you connect to an Agent,
					the state of their ports is unknown and must be analyzed using the Port State Analyzer, available under the
					"portanalyzer" Terminal command.
				"""
			},
			"objectives": {
				"download": ["home/DOWNLOAD_ME", "RTOWER_TEST_AGENT"]
			},
			"nextmission": "tools",
			"isRead": false
		}
    }
}
