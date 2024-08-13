extends Panel

@onready var viewport: Node = $Viewport
var emailDict = globaldata.emailDict

func _on_terminal_button_pressed():
	clearViewport()
	var packedTerminal: PackedScene = preload("res://prefab/terminal.tscn")
	var terminalInstance: Node = packedTerminal.instantiate()
	viewport.add_child(terminalInstance)


func _on_open_mail_view_pressed():
	clearViewport()
	var packedMail: PackedScene = preload("res://prefab/mail.tscn")
	var mailInstance: Node = packedMail.instantiate()
	viewport.add_child(mailInstance)
	mailInstance.connect("openMail", Callable(_on_mail_open))

func _on_mail_open(idx):
	print(idx)
	clearViewport()
	var packedReader: PackedScene = preload("res://prefab/mailReader.tscn")
	var readerInstance: Node = packedReader.instantiate()
	viewport.add_child(readerInstance)
	readerInstance.connect("goBack", _on_open_mail_view_pressed)
	readerInstance.get_child(1).set_text("Sender: %s" % emailDict[idx]["sender"])
	readerInstance.get_child(2).set_text("Subject: %s" % emailDict[idx]["subject"])
	readerInstance.get_child(3).get_child(0).set_text(emailDict[idx]["content"])
	emailDict[idx]["isRead"] = true

func _on_connection_view_pressed():
	clearViewport()
	var packedConnection: PackedScene = preload("res://prefab/connection.tscn")
	var connectionInstance: Node = packedConnection.instantiate()
	viewport.add_child(connectionInstance)
	connectionInstance.connect("openFsWindow", _on_open_fs_window)

func _on_open_fs_window():
	clearViewport()
	var packedFsViewer: PackedScene = preload("res://prefab/filesystem.tscn")
	var fsViewerInstance: Node = packedFsViewer.instantiate()
	viewport.add_child(fsViewerInstance)
	fsViewerInstance.connect("back", _on_connection_view_pressed)

func clearViewport():
	var children: Array[Node] = viewport.get_children()
	for child: Node in children:
		child.queue_free()
