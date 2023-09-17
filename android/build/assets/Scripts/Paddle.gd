extends CharacterBody2D

# Speed of the paddle
@export var speed : float = 400

# The function _physics_process runs every physics frame; this is where we'll put the movement code.
func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0
	)
	


	velocity = input_direction * speed
	
	move_and_slide()
	
