extends Node

var main : Node
var player : Player
@onready var player_scene : PackedScene = preload("res://Player/player.tscn")

#UI
var drag_container : DragContainer

func _ready():
	main = get_node("/root/Main")
	if not main :
		print("Not in main : instantiating Player")
		player = player_scene.instantiate()
		get_node("/root").add_child(player)
	else :
		player = get_node("/root/Main/Shop/Player") as Player
	

func get_player() -> Player:
	return player
