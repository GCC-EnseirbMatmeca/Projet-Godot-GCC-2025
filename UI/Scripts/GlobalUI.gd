extends Control

var dragged_node : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_draggable_parent(self)
	pass

func set_draggable_parent(n : Control):
	if n.get_child_count() == 0:
		return 
	else:
		for c in n.get_children():
			if c is MarginIcon:
				var m : MarginIcon = c
				m.draggedContainer = self
			else:
				set_draggable_parent(c)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
