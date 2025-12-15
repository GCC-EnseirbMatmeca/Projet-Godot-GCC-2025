extends Node2D
class_name FireBall

var path_follow : PathFollow2D = null

var progress : float = 0.0

func set_path_follow(a_path_follow):
	path_follow = a_path_follow
	path_follow.loop = false

func _process(delta):
	path_follow.progress = progress
	position = path_follow.position
	progress += 30 * delta
	if path_follow.progress_ratio >= 1 :
		queue_free()
