class_name DecorationManager
extends Node2D

@onready var decoration_menu: DecorationMenu = %DecorationMenu

enum Selection {
	IDLE,
	CREATE,
	EDIT
}

var selected_decoration: Decoration
var current_state: Selection = Selection.IDLE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !selected_decoration:
		return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func select(decoration: Decoration) -> void:
	if selected_decoration == decoration: 
		return
	deselect()
	selected_decoration = decoration
	selected_decoration.select()

func deselect() -> void:
	if !selected_decoration:
		return
	selected_decoration.deselect()
	selected_decoration = null
	

func _on_decoration_menu_decoration_created(decoration: Decoration) -> void:
	decoration.decoration_manager = self
	add_child(decoration)
	decoration.global_position = get_global_mouse_position()
	select(decoration)
	

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


func _on_decoration_menu_cancel_pressed() -> void:
	
	pass # Replace with function body.
