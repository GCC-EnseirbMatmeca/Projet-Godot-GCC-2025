extends Control
class_name DragContainer

var dragged_obj : Draggable = null

func _ready() -> void:
	Global.drag_container = self
