class_name DecorationMenu
extends PanelContainer

@onready var decoration_grid: GridContainer = %DecorationGrid

@export var decoration_menu_item_scene: PackedScene
@export var decoration_item_scene: PackedScene

var selected_menu_item: DecorationMenuItem

signal decoration_created(decoration: Decoration)
signal item_deselected()

signal cancel_pressed()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawned_menu_item: DecorationMenuItem
	
	for decoration_info: DecorationInfo in DecorationLoader.decoration_info:
		spawned_menu_item = decoration_menu_item_scene.instantiate()
		spawned_menu_item.decoration_info = decoration_info
		spawned_menu_item.decoration_menu = self
		decoration_grid.add_child(spawned_menu_item)


func select_menu_item(menu_item: DecorationMenuItem) -> void:
	if menu_item == selected_menu_item:
		deselect_menu_items()
		return
		
	deselect_menu_items()
	selected_menu_item = menu_item
	menu_item.select_item()
	spawn_decoration(menu_item.decoration_info)

func deselect_menu_items() -> void:
	if !selected_menu_item:
		return
	selected_menu_item.deselect_item()
	selected_menu_item = null
	item_deselected.emit()
	

func spawn_decoration(decoration_info: DecorationInfo) -> void:
	var spawned_decoration: Decoration = decoration_item_scene.instantiate()
	spawned_decoration.decoration_info = decoration_info
	decoration_created.emit(spawned_decoration)
	pass
	


func _on_button_pressed() -> void:
	cancel_pressed.emit()
