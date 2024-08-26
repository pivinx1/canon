extends Control

signal play(bgm: String)

@onready var music: Dictionary = globaldata.musicDict
@export var sfxPlayer: AudioStreamPlayer
var mailTimeout: int = 3
@onready var emailReceivedEffect: AudioStreamWAV = preload("res://sounds/sfx/EmailSound.wav")

func _ready():
	play.emit(music["postCreation"])
	await get_tree().create_timer(mailTimeout).timeout
	_getmail("intro")
	


func _on_toolbar_exit():
	var confirmationBoxPacked: PackedScene = preload("res://prefab/closeConfirmBox.tscn")
	var boxInstance: Node = confirmationBoxPacked.instantiate()
	add_child(boxInstance)
	boxInstance.global_position = Vector2(327, 176)

func _getmail(mission: String):
	var newEmail: Dictionary = missions.missions[mission]
	globaldata.emailDict[mission] = newEmail
	sfxPlayer.stream = emailReceivedEffect
	sfxPlayer.play()
	globaldata.activeMission = missions.missions[mission]


func _on_server_map_connected_to_sector(sector):
	if globaldata.activeMission["objectives"].has("connect_toSector"):
		globaldata.activeMission["objectives"]["connect_toSector"][0] = true
	else:
		pass
