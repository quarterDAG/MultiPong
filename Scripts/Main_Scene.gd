extends Node2D

@export var ball_init_position = Vector2(300, 535)
@export  var current_ball : RigidBody2D
@export var pause_timer : Timer

@onready var ball_prefab = preload("res://Scenes/Object Scenes/Ball.tscn")

func _on_goal_hit():
	if (ball_prefab == null):
		print("Error: ball_scene is null.")
		return
	print("Goal hit signal received")  # Debug line
	current_ball.queue_free()
	emit_signal("ball_destroyed")
	pause_timer.start()
	# spawn_new_ball()

func spawn_new_ball():
	print("Spawning new ball")  # Debug line
	current_ball = ball_prefab.instantiate()
	add_child(current_ball)
	current_ball.position = ball_init_position
