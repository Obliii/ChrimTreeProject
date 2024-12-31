class_name DecorationMenuItem
extends PanelContainer

@onready var decoration_texture: TextureRect = %DecorationTexture
@onready var decoration_name: Label = %DecorationName

@export var decoration_info: DecorationInfo
var decoration_menu: DecorationMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	decoration_name.text = decoration_info.name
	decoration_texture.texture = decoration_info.texture


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if Input.is_action_just_pressed("click"):
			decoration_menu.select_menu_item(self)
			accept_event()

func select_item() -> void:
	decoration_texture.texture = null
	
func deselect_item() -> void:
	decoration_texture.texture = decoration_info.texture
