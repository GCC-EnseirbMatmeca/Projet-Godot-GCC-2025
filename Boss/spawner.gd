@tool
extends Node2D

@export var repetitions: int = 6:
	set(value):
		repetitions = max(1, value)
		if not Engine.is_editor_hint():
			return
		if not get_tree() :
			return
		for c in get_children():
			c.name += "tmp"
			c.queue_free()
		for i in range(repetitions):
			var new_path : Path2D = Path2D.new()
			new_path.curve = curve
			new_path.rotation = rotation_offset + (2 * PI * i / repetitions)
			new_path.name = "Path_%d" % i
			add_child(new_path)
			new_path.owner = get_tree().edited_scene_root
			
			var path_follow : PathFollow2D = PathFollow2D.new()
			path_follow.name = "PathFollow_%d" % i
			new_path.add_child(path_follow)
			path_follow.owner = get_tree().edited_scene_root

@export var rotation_offset: float = 0.0:
	set(value):
		if not Engine.is_editor_hint():
			return
		rotation_offset = value
		for i : int in range(get_children().size()):
			get_child(i).rotation = rotation_offset + (2 * PI * i / repetitions)


@export var patterns : Dictionary[String, Curve2D] = {}
@export_enum("Flower", "Line", "Spiral") var pattern_name : String = "Flower" :
	set(value):
		pattern_name = value
		curve = patterns[pattern_name]
		for i in get_children():
			(i as Path2D).curve = curve
var pattern_name_list : Array[String] = ["Flower", "Line", "Spiral"]
@onready var curve : Curve2D = patterns[pattern_name]
@onready var ball : PackedScene = preload("res://Boss/fireball.tscn")

var timer_set : float = 1.0
var timer : float = 0.0
var num_ball : int = 20
func _ready():
	if Engine.is_editor_hint():
			return
	pattern_name = pattern_name_list.pick_random()
	##print(pattern_name)
	timer = timer_set
	##Global.get_player()
	
	pass

func _process(delta):
	if Engine.is_editor_hint():
		return
	timer -= delta
	if timer <= 0.0 :
		timer = timer_set
		spawn_ball()

func spawn_ball() -> void :
	num_ball -= 1
	if num_ball < 0 :
		return
	for i in get_children():
		var ball_instance : FireBall = ball.instantiate()
		ball_instance.set_path_follow(i.get_child(0)) 
		i.add_child(ball_instance)
