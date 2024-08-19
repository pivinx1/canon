extends Panel

const ramFreePrefab: String = "%s MqB free"
@onready var ramfreelabel: Label = $RAMFree
var playerStats: Dictionary = playerdata.playerStats

func _process(delta):
	ramfreelabel.set_text(ramFreePrefab % str(playerStats["ramPool"] - playerStats["ramUsage"]))
