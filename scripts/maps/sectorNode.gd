extends Control

signal connect(addr: String)
var nodeAddr = self.name

func _on_texture_button_pressed():
	connect.emit(nodeAddr)
