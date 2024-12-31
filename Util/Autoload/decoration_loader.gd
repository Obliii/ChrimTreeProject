extends Node2D

var decoration_scene: PackedScene = preload("res://Objects/Scenes/decoration.tscn")

static var decoration_info: Array[DecorationInfo] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for decoration in DirAccess.get_files_at("res://Resources/Decorations"):
		var decoration_filename = "res://Resources/Decorations/" + decoration.trim_suffix('.remap')
		var loaded_decoration: DecorationInfo = load(decoration_filename) as DecorationInfo
		decoration_info.append(loaded_decoration)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("spawn_decoration"):
		if(decoration_info.size):
			spawn_decoration(decoration_info.pick_random())

func spawn_decoration(info: DecorationInfo):
	var spawned_decoration : Decoration = decoration_scene.instantiate()
	spawned_decoration.decoration_info = info
	get_tree().root.add_child(spawned_decoration)
	spawned_decoration.global_position = get_global_mouse_position()
