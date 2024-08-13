extends Control

signal back

@onready var tree: Tree = $FSTree
@onready var label: Label = $Label
var connectionFs: Dictionary = globaldata.connectionDict["filesystem"]

# Called when the node enters the scene tree for the first time.
func _ready():
	label.set_text("Filesystem of %s" % globaldata.connectionDict["hostname"])
	scanFilesystem()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func scanFilesystem():
	tree.create_item()
	populate_tree(tree, connectionFs)
	
func populate_tree(tree: Tree, dictionary: Dictionary, parent: TreeItem = null) -> void:
	for key in dictionary.keys():
		var value = dictionary[key]
		var item: TreeItem
		if parent == null:
			item = tree.create_item()
		else:
			item = tree.create_item(parent)
		item.set_text(0, key)
		if typeof(value) == TYPE_DICTIONARY:
			populate_tree(tree, value, item)
		else:
			item.set_metadata(0, value)  # Optional: store the value in metadata for future use


func _on_back_pressed():
	back.emit()
