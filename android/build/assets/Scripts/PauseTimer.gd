extends Timer

@onready var label = $Label

func _ready():
	start()


func _process(delta):
	var time_left = int(get_time_left())
	if time_left > 0:
		label.text = str(time_left)
	else:
		label.text = "Go!"


func _show_timer():
	print("Show Timer")
	label.visible = true  # Make the label visible when the timer starts
	
func _on_PauseTimer_timeout():
	# await get_tree().create_timer(1.0).timeout  # Wait for 1 second
	label.visible = false  # Hide the label
