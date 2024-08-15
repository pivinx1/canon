extends Control

signal back
signal openFileReader(fname: String, fcontent: String)

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

func findItem(tree: Tree, fs: Dictionary, item: String):
	for key in fs.keys():
		print("Key: " + key)
		var value = fs[key]
		print("Found value: " + str(value))
		if key == item:
			print("Found item")
			print(value)
			return fs[key]
		elif typeof(value) == TYPE_DICTIONARY:
			print("Advancing to folder " + key + "\n")
			var result = findItem(tree, value, item)
			if result!= null:
				return result
		else:
			print("Continuing search\n")
	return null

func _on_back_pressed():
	back.emit()


func _on_fs_tree_item_mouse_selected(position, mouse_button_index):
	var item = tree.get_item_at_position(position)
	var fname = item.get_text(0)
	openFileReader.emit(fname ,findItem(tree, connectionFs, fname))
