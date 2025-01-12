extends Node

# Limits
const MAXIMUM_OBJECTS = 500

# Important
@onready var screen_resolution: Vector2 = Vector2(960,540)
@onready var object_size: Vector2 = Vector2(64,64)

# Objects
@onready var main_camera: Camera2D
@onready var music_player: AudioStreamPlayer2D
@onready var sound_player: AudioStreamPlayer2D
@onready var decoration_manager: DecorationManager

# States
@onready var main_state = $GameStates/MainWorldState
@onready var start_state = $GameStates/StartMenuState
@onready var pause_state = $GameStates/PauseMenuState
@onready var current_game_state: State = start_state

var game_started: bool = false
signal new_state_entered(new_state)

func reset_main_scene():
	decoration_manager.clear_all_decorations()
	_enter_new_game_state(main_state)

func _enter_new_game_state(new_state):
	# If the state is already there, don't process further.
	if new_state == current_game_state:
		push_error("Attempting to enter state %s when already there." %new_state)
		return
	
	# Exit old State and enter into new state.
	if current_game_state != null:
		current_game_state._exit_state()
		
	current_game_state = new_state
	current_game_state._enter_state()
	new_state_entered.emit(new_state)
	print("Entered into %s" %new_state)
