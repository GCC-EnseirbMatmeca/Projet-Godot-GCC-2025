extends CharacterBody2D
class_name Player

const SPEED = 300.0 * 60

func _ready() -> void :
	pass

func _physics_process(delta): # delta = 1/fps	
	var direction : Vector2 = Input.get_vector("left","right","up","down")
	if direction:
		velocity = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
