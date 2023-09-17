extends RigidBody2D

var speed: float = 400

func _ready():
	add_to_group("Ball")
	set_initial_velocity()

func set_initial_velocity():
	var direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
	self.linear_velocity = direction * speed

func _physics_process(_delta):
	self.linear_velocity = self.linear_velocity.normalized() * speed
