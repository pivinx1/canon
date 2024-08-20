extends Panel

signal refreshSector

@onready var nodeCircle: PackedScene = preload("res://prefab/sectorNode.tscn")
@onready var grid: GridContainer = $GridContainer
@onready var sectorLogos: Dictionary = {
	"reversetower": preload("res://textures/sanctifiers_logo.png"),
	"rossum": preload("res://textures/rossum_logo.png"),
}
@onready var sectorLogoBg: TextureRect = $TextureRect

func _ready():
	_refreshMap()

func _refreshMap():
	for sector in globaldata.playerKnownSectors:
		var sectorCircle: TextureButton = nodeCircle.instantiate()
		grid.add_child(sectorCircle)
		sectorCircle.set_name(sector)
		sectorCircle.set_tooltip_text(sector)
		sectorCircle.connect("pressed", _gotoSector.bind(sector))

func _gotoSector(sector: String):
	globaldata.currentSector = sector
	sectorLogoBg.texture = sectorLogos[sector]
	refreshSector.emit()
