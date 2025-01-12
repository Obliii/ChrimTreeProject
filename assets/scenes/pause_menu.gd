extends Control

@onready var continue_button = $PanelContainer/VBoxContainer/ContinueButton
@onready var screenshot_button = $PanelContainer/VBoxContainer/ScreenshotButton
@onready var restart_button = $PanelContainer/VBoxContainer/RestartButton
@onready var exit_button = $PanelContainer/VBoxContainer/ExitButton

func _on_continue_button_pressed() -> void:
	Main._enter_new_game_state(Main.main_state)

func _on_screenshot_button_pressed() -> void:
	Main._enter_new_game_state(Main.main_state)
	await get_tree().create_timer(0.1).timeout
	var screenshot_path = OS.get_user_data_dir() + "/tree_screenshot_" + Time.get_date_string_from_system() + ".jpg"
	var image = get_viewport().get_texture().get_image()
	image.save_jpg(screenshot_path)
	
func _on_restart_button_pressed() -> void:
	Main.reset_main_scene()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
