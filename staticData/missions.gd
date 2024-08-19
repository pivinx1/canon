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
		As a form of training, my first order for you is to head to the Rossum sector.\n
		Do as I said and return to me once you are ready to continue.
		""",
		"attachments": {
			"link1": "ROSSUM_SECTOR"
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

    }
}
