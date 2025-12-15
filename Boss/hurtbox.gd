extends Area2D


func _on_body_entered(body):
	if body is Player:
		var player : Player = (body as Player)
		# player.hurt()
	pass # Replace with function body.
