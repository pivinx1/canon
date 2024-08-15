extends Control

signal exit

@onready var content: Label = $Panel/ScrollContainer/FileContent
@onready var header: Label = $Filename


func _on_button_pressed():
	exit.emit()
