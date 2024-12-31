class_name DecorationSelector
extends Node2D

@onready var decoration_menu: DecorationMenu = %DecorationMenu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_decoration_menu_decoration_created(decoration: Decoration) -> void:
	get_parent().add_child(decoration)
	decoration.global_position = get_global_mouse_position()
	


# Selecting Decorations
# I'd like to only have one decoration selectable / holdable
# So lets change it up

# When user clicks on a decoration, pick it up! Which one? Who knows!
# We can figure that out later

# Should this be a part of the decoration menu? Probably not
# But it doesn't need to be anywhere else! So here it is!
