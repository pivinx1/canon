extends Panel

var ex: Expression = Expression.new()

@onready var progressbar: ProgressBar = $ProgressBar
@onready var usageLabel: Label = $Usage

func _process(delta):
	var operandPool: int = playerdata.playerStats["operandPool"]
	var operandUsage: int = playerdata.playerStats["operandUsage"]
	var percentageEx: int = ex.parse("(x / y) * 100", ["x", "y"])
	var percentage = ex.execute([operandUsage, operandPool])
	
	progressbar.value = percentage.ceil()
	usageLabel.set_text("{usage}/{pool} Operands".format({"usage": str(operandUsage), "pool": str(operandPool)}))
