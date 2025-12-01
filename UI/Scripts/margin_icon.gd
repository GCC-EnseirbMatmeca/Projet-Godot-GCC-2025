@tool
extends MarginContainer
class_name MarginIcon

@export var tex : Texture
@export var isHovered : bool = false
@export var isDragged : bool = false
@export var draggedContainer : Control

var old_parent : Control

var tex_rec : TextureRect

func _ready() -> void:
	if tex != null:
		tex_rec = get_child(0)
		tex_rec.texture = tex

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		tex_rec = get_child(0)
		tex_rec.texture = tex
		return 
	tex_rec.material.set("shader_parameter/active", 1 if isHovered else 0)
	scale = Vector2(1.5, 1.5) if isHovered else Vector2.ONE # PLACEHOLDER
	
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && ( isHovered || isDragged) ):
		if(!isDragged):
			startDrag()
		self.position = get_viewport().get_mouse_position() - self.size 
	else:
		isDragged = false

func startDrag():
	old_parent = get_parent()
	isDragged = true
	self.reparent(draggedContainer, true)
	pass

func stopDrag():
	pass

func _on_mouse_entered() -> void:
	isHovered = true
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	isHovered = false
	pass # Replace with function body.
