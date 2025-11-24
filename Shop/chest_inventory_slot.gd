extends Control

@export var is_used = false
@export var pos = 0

func use_slot():
	is_used = true

func free_slot():
	is_used = false
