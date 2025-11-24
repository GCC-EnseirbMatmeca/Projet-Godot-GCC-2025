extends Node2D
class_name Door

@export var next_room : Main.RoomType

func _on_area_2d_body_entered(body):
	if body is Player :
		SignalBus.load_room.emit(next_room)
