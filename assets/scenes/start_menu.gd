extends Control

var start_button: Button
var settings_button: Button

func _ready() -> void:
	pass

func _on_start_button_pressed() -> void:
	Main._enter_new_game_state(Main.main_state)
	Main.game_started = true

func _on_settings_button_pressed() -> void:
	#Main._enter_new_game_state(Main.settings_state)
	pass
