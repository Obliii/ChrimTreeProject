class_name PauseMenuState
extends State

@export var menu: Control

func _enter_state():
	menu.visible = true

func _exit_state():
	menu.visible = false

func _update_process():
	if Input.is_action_just_pressed("ui_cancel"):
		Main._enter_new_game_state(Main.main_state)
