extends Panel




func _on_confirm_pressed():
	get_tree().quit()
	

func _on_cancel_pressed():
	queue_free()
