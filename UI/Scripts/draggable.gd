extends Node
class_name Draggable

var isBeingDragged : bool = false
var isBeingHovered : bool = false

var parent : CanvasItem
var canvas_group : CanvasGroup

@export var parent_shader : Material

func _ready() -> void:
	parent = get_parent()
	parent.mouse_entered.connect(_on_mouse_hover)
	parent.mouse_exited.connect(_on_mouse_hover_off)
	if parent != null:
		canvas_group = CanvasGroup.new()
		parent.add_sibling.call_deferred(canvas_group)
		parent.reparent.call_deferred(canvas_group)
	else:
		print("Is null")
	canvas_group.material = parent_shader

func _process(_delta: float) -> void:
	if isBeingHovered && Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && !isBeingDragged:
		if Global.drag_container != null and Global.drag_container.dragged_obj == null:
			Global.drag_container.dragged_obj = self
			isBeingDragged = true
			
			canvas_group.reparent(Global.drag_container)
	
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if isBeingDragged:
			Global.drag_container.dragged_obj = null
		isBeingDragged = false
		
	if isBeingDragged:
		canvas_group.position = get_viewport().get_mouse_position()
	
	canvas_group.material.set("shader_parameter/active", 1 if isBeingHovered else 0)

func _on_mouse_hover():
	isBeingHovered = true
	
func _on_mouse_hover_off():
	isBeingHovered = false
