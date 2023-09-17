extends Area2D

# Declare a signal to be emitted when the ball hits the goal
signal goal_hit(player)

func _ready():
	add_to_group("Goal")

func _on_body_entered(body):
	print("Something entered the goal")
	if body.is_in_group("Ball"):
		print("Ball entered the goal")
		emit_signal("goal_hit")
		# body.reset_position()


