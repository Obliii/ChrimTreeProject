extends RichTextLabel

@export var start_text : Array[String]

func _ready() -> void:
	var num_start_text = start_text.size() - 1
	text = start_text[randi_range(0, num_start_text)]
