@tool
extends Node

@onready var collision : CollisionShape2D = $Area/Collision

## Value of the damage taken
@export var damage_value : float = 1.0

## Damage are taken each damage timer in seconds
## if null damage are taken once when the object is created
@export var damage_timer : float = 0.0

var timer : float = damage_timer

## The radius in which damage are taken
@export_range(0.0, 100.0) var radius : float = 10.0 :
	set(new_value):
		(collision.shape as CircleShape2D).radius = new_value
		radius = new_value

func _process(delta):
	if damage_timer == 0.0 :
		return
		
	timer -= delta
	if timer <= 0 :
		timer = damage_timer
		# TODO : handle damage

func _on_area_body_entered(body):
	# ???
	pass # Replace with function body.
