extends Control

signal play(bgm: String)

@onready var music: Dictionary = globaldata.musicDict

# Called when the node enters the scene tree for the first time.
func _ready():
	play.emit(music["postCreation"])



func _on_toolbar_exit():
	var confirmationBoxPacked: PackedScene = preload("res://prefab/closeConfirmBox.tscn")
	var boxInstance: Node = confirmationBoxPacked.instantiate()
	add_child(boxInstance)
	boxInstance.global_position = Vector2(327, 176)
