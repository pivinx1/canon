extends Panel

signal exit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_exit_game_pressed():
	exit.emit()
	
