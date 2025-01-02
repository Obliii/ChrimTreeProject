class_name Decoration
extends StaticBody2D

@export var decoration_info: DecorationInfo
@export var decoration_manager: DecorationManager

@onready var sprite: Sprite2D = %Sprite2D
@onready var selected_ui: NinePatchRect = %SelectedUI




var draggable: bool = false
var dragging: bool = false
var offset: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = decoration_info.texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# No need to process if we're not dragging this decoration
	if !dragging:
		return
	
	# We're dragging and record the offset	
	if Input.is_action_just_pressed("click"):
		offset = get_global_mouse_position() - global_position
		get_parent().move_child(self, -1)
		
	# Keep it moving
	if dragging and Input.is_action_pressed("click"):
		global_position = global_position.lerp(get_global_mouse_position() - offset, 25 * delta)
	# and finished!
	elif Input.is_action_just_released("click"):
		dragging = false

func _on_input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if (Input.is_action_just_pressed("click")):
		viewport.set_input_as_handled()
		dragging = true
		decoration_manager.select(self)
	if (Input.is_action_just_released("click")):
		dragging = false
	pass # Replace with function body.


		
# Current issues
# - Overlapping Draggables can be selected at the same time
#		Have an array of decorations that are on screen, 

func select() -> void:
	selected_ui.show()
	# Activate draggable functionality
	# see the decoration_manager

func deselect() -> void:
	selected_ui.hide()
	dragging = false
	# Deactivate draggable functionality
	# see the decoration_manager
