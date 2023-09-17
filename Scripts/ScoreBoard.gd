extends CanvasLayer

var player1_score = 0
var player2_score = 0

@onready var player1_score_label = $"Score 1"
@onready var player2_score_label = $"Score 2"

@export var pause_timer : Timer

signal game_resumed()


# Function to update the score
func _on_goal_hit(player : int):
	update_score(player)
	get_tree().paused = true  # Pause the game
	pause_timer.start()
	pause_timer._show_timer()



# Timer timeout function to resume the game
func _on_pause_timer_timeout():
	get_tree().paused = false  # Unpause the game
	emit_signal("game_resumed")
	
func update_score(player):
	if player == 1:
		player1_score += 1
		player1_score_label.text = str(player1_score)
	elif player == 2:
		player2_score += 1
		player2_score_label.text = str(player2_score)
		
	print("Player 1 Score: ", player1_score)
	print("Player 2 Score: ", player2_score)
