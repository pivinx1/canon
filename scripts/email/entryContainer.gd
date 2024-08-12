extends VBoxContainer

signal openMail(idx: String)

var emailDictionary: Dictionary = globaldata.emailDict
var entryPrefab: PackedScene = preload("res://prefab/mailEntry.tscn")
var container: Node = self
var monitorView: Node = get_parent().get_parent().get_parent()

func _ready():
	for key in emailDictionary:
		createEntry(key)
	

func _openMail(idx: String):
	pass

func createEntry(idx: String):
	var emailData: Dictionary = emailDictionary[idx]
	var newItem: Node = entryPrefab.instantiate()
	add_child(newItem)
	newItem.name = idx
	newItem.connect("pressed", Callable(get_parent(), "_openMail").bind(idx))
	newItem.get_child(0).set_text(emailData["sender"])
	newItem.get_child(1).set_text(emailData["subject"])
	if emailData["isRead"]:
		newItem.get_child(2).hide()
