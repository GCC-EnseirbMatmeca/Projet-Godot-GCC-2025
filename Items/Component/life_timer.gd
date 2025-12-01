extends Node

@export var time : float = 1.0

func _ready():
	await get_tree().create_timer(time).timeout
	get_parent().queue_free()
