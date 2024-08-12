extends Panel

@onready var viewport = get_node("Viewport")

func _on_terminal_button_pressed():
	clearViewport()
	var packedTerminal: PackedScene = preload("res://prefab/terminal.tscn")
	var terminalInstance: Node = packedTerminal.instantiate()
	viewport.add_child(terminalInstance)


func _on_open_mail_view_pressed():
	clearViewport()

func _on_mail_open():
	pass

func _on_connection_view_pressed():
	clearViewport()
	var packedConnection: PackedScene = preload("res://prefab/connection.tscn")
	var connectionInstance: Node = packedConnection.instantiate()
	viewport.add_child(connectionInstance)
	
func clearViewport():
	var children: Array[Node] = viewport.get_children()
	for child: Node in children:
		child.queue_free()
