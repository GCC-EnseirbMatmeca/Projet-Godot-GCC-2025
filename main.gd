extends Node
class_name Main

enum RoomType {SHOP,ARENA}

@export var player : Player

@onready var room_array : Array[PackedScene] = [preload("res://Shop/shop.tscn"), preload("res://Arena/arena.tscn")]

func _ready():
	SignalBus.load_room.connect(load_room)
	
func load_room(room : Main.RoomType):
	var previous_room : Node = player.get_parent()
	var next_room = room_array[room].instantiate()
	add_child.call_deferred(next_room)
	player.reparent(next_room)
	if previous_room != self :
		previous_room.queue_free()
