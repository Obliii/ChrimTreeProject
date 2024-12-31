class_name Decoration
extends StaticBody2D

@export var decoration_info: DecorationInfo

@onready var sprite: Sprite2D = $Sprite2D

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
	if !draggable:
		return
	
	# We're dragging and record the offset	
	if Input.is_action_just_pressed("click"):
		dragging = true
		offset = get_global_mouse_position() - global_position
		get_parent().move_child(self, -1)
		
	# Keep it moving
	if dragging and Input.is_action_pressed("click"):
		global_position = global_position.lerp(get_global_mouse_position() - offset, 25 * delta)
	# and finished!
	elif Input.is_action_just_released("click"):
		dragging = false
	

func _on_mouse_entered() -> void:
	draggable = true
	scale = Vector2(1.05, 1.05)

func _on_mouse_exited() -> void:
	if !dragging:
		draggable = false
		scale = Vector2(1, 1)
		
# Current issues
# - Overlapping Draggables can be selected at the same time
#		Have an array of decorations that are on screen, 
