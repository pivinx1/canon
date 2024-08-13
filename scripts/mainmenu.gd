extends Control

@onready var mainmenubuttons = $MainMenuButtons
@onready var registerForm = $RegisterScreen


func _on_quit_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	mainmenubuttons.hide()
	registerForm.show()


func _on_register_screen_main_menu_show():
	mainmenubuttons.show()
