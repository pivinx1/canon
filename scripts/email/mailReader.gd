extends Control

signal goBack

func _on_button_pressed():
	goBack.emit()
