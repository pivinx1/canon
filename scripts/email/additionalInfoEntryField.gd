extends Control

signal infoAdded(info: String)

@export var addButton: Button
@export var infoLineEdit: LineEdit
@export var submitButton: Button
@export var infoViewLabel: Label


func _on_add_pressed():
	addButton.hide()
	infoLineEdit.show()
	submitButton.show()




func _on_submit_pressed():
	infoViewLabel.set_text(infoLineEdit.text)
	infoViewLabel.show()
	infoLineEdit.hide()
	submitButton.hide()
	infoAdded.emit(infoLineEdit.text)
