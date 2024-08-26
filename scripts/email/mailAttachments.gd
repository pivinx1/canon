extends Control

@export var attachmentContainer: VBoxContainer
@onready var attachmentPrefab: PackedScene = preload("res://prefab/attachment.tscn")

const attachmentLabelPrefab: String = "{type}: {content}"

signal goBack

func _ready():
	for attachment in globaldata.activeEmailDict:
		match attachment["type"]:
			"sectorlink":
				var attachmentInstance = attachmentPrefab.instantiate()
				attachmentInstance.get_child(0).set_text(attachmentLabelPrefab.format({"type": "SECTOR LINK", "content": attachment["content"].upper()}))
				attachmentInstance.get_child(1).connect("pressed", _add_sectorlink.bind(attachment["content"]))

func _on_button_pressed():
	goBack.emit()

func _add_sectorlink(sector: String):
	globaldata.playerKnownSectors.append(sector)
