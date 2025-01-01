class_name DecorationManager
extends Node2D

@onready var decoration_menu: DecorationMenu = %DecorationMenu

var selected_decoration: Decoration

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !selected_decoration:
		return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_decoration_menu_decoration_created(decoration: Decoration) -> void:
	add_child(decoration)
	decoration.global_position = get_global_mouse_position()

func clear_all_decorations() -> void:
	selected_decoration = null
	decoration_menu.deselect_menu_items()
	
	for decoration: Decoration in get_children():
		decoration.queue_free()

# Selecting Decorations
# I'd like to only have one decoration selectable / holdable
# So lets change it up

# When user clicks on a decoration, pick it up! Which one? Who knows!
# We can figure that out later

# Should this be a part of the decoration menu? Probably not
# But it doesn't need to be anywhere else! So here it is!
