extends Area2D

var speed = 20  # Starting speed
var max_speed = 1000  # Maximum speed
var acceleration = 100  # Acceleration rate
var direction = Vector2.RIGHT  # Initial direction
var bullet_type: int = 0  # Type of bullet

# Update the position each frame based on speed and direction
func _physics_process(delta):
	speed = min(speed + acceleration * delta, max_speed)
	position += direction * speed * delta

# Free the bullet when it exits the screen
func _on_screen_exited():
	queue_free()

# Set the bullet type
func set_property(type):
	bullet_type = type

# Handle the game-over logic
func end_game():
	get_tree().change_scene_to_file("res://gameover.tscn")

# Check if the bullet hits the player
func _on_body_entered(body):
	if body.name == "player":
		body.end_game()
