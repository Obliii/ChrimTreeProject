extends Node2D

@export var _start_scene: State
@export var _main_scene: State
@export var _pause_scene: State

func _ready() -> void:
	init_game()
	Main._enter_new_game_state(Main.start_state)

func _process(delta: float) -> void:
	Main.current_game_state._update_process()
	Main.current_game_state._update_physics()

func init_game():
	Main.start_state = _start_scene
	Main.main_state = _main_scene
	Main.pause_state = _pause_scene
	Main.sound_player = $SoundPlayer
	Main.music_player = $MusicPlayer
	print("Initialized States.")
