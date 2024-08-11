extends Control

@export var entry_field: TextEdit
@export var echo_box: TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event == Input.is_action_just_pressed("ui_accept"):
		
