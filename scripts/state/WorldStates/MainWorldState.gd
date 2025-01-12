class_name MainWorldState
extends State

@export var main_game: Control

func _enter_state():
	main_game.visible = true
	Main.music_player.stream_paused = false

func _exit_state():
	Main.music_player.stream_paused = true

func _update_process():
	if Input.is_action_just_pressed("ui_cancel"):
		Main._enter_new_game_state(Main.pause_state)
