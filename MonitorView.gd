extends Panel

@onready var viewport = get_node("Viewport")

func _on_terminal_button_pressed():
	print("im doing something")
	var packedTerminal: PackedScene = preload("res://prefab/terminal.tscn")
	var terminalInstance: Node = packedTerminal.instantiate()
	viewport.add_child(terminalInstance)
	print("im done doing something")
