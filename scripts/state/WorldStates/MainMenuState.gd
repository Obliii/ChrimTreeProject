class_name MainMenuState
extends State

@export var start_ui: Control

func _enter_state():
	start_ui.visible = true

func _exit_state():
	start_ui.visible = false
