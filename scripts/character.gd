extends CharacterBody2D

var acceleration = Vector2()

func _physics_process(delta: float) -> void:
	
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	acceleration = input_direction * Global.speed
	
	if (input_direction.x == 0 or input_direction.y == 0):
		velocity.x = move_toward(velocity.x, 0, Global.friction)
		velocity.y = move_toward(velocity.y, 0, Global.friction)
	
	velocity = velocity.limit_length(Global.maxspeed)
	velocity += acceleration
	
	move_and_slide()
