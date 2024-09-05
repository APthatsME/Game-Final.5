extends State

@onready var collision = $CollisionShape2D  # Reference to the collision shape

var player_entered: bool = false:  # Tracks if the player has entered
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)  # Enable/disable collision based on player entry

# Called when the player enters
func _on_player_entered(body):
	player_entered = true

# Handle state transition
func transition():
	if player_entered:
		get_parent().change_state("5Leaf")  # Change to "5Leaf" state if the player has entered
