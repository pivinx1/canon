extends Control

signal goBack
signal attachments(mission: String)
signal reply(mission: String)

func _on_button_pressed():
	goBack.emit()
