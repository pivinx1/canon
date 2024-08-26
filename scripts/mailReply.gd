extends Control

signal completeMission(additionalInfo: Array[String])

var additionalInfoArr: Array[String]

@export var additionalInfoContainer: VBoxContainer
@onready var additionalInfoPrefabPacked: PackedScene = preload("res://prefab/additionalInfoEntryField.tscn")

func _ready():
	addInfoField()

func _submit(info: String):
	additionalInfoArr.append(info)
	addInfoField()

func addInfoField():
	var additionalInfoPrefab: Node = additionalInfoPrefabPacked.instantiate()
	additionalInfoPrefab.get_child(3).connect("pressed", _submit)


func _on_button_pressed():
	completeMission.emit(additionalInfoArr)
