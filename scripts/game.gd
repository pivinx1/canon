extends Control

signal play(bgm: String)

@onready var music: Dictionary = globaldata.musicDict

# Called when the node enters the scene tree for the first time.
func _ready():
	play.emit(music["postCreation"])

