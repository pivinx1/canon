extends Control

signal mainMenuShow

var playerInfo = playerdata.playerInfoDict

@onready var playerGenderField = $NameBlock/GenderPicker
@onready var playerNameField = $NameBlock/NameLineEdit
@onready var passwordField = $PasswordLineEdit
@onready var passwordConfirmation = $ConfirmPassword

@onready var confirmButton = $Confirm
@onready var abortButton = $Abort

func _process(delta):
	if playerGenderField.selected != -1 and playerNameField.text != "" and passwordField.text != "" and passwordConfirmation.text == passwordField.text:
		confirmButton.show()
	else:
		confirmButton.hide()
		



func _on_abort_pressed():
	playerGenderField.selected = -1
	playerNameField.text = ""
	passwordField.text = ""
	passwordConfirmation.text = ""
	hide()
	mainMenuShow.emit()


func _on_confirm_pressed():
	playerInfo["playerName"] = playerNameField.text
	match playerGenderField.selected:
		0:
			playerInfo["playerGender"] = "M"
		1:
			playerInfo["playerGender"] = "F"
	playerInfo["playerMac"] = globaldata.generateMacAddr()
	print("Player's MAC address is %s" % playerInfo["playerMac"])
	get_tree().change_scene_to_file("res://scenes/game.tscn")
