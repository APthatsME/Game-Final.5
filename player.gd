extends CharacterBody2D

var speed = 250  # Movement speed

func _physics_process(_delta):
	# Update velocity based on input and move the character
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	move_and_slide()
	
	# Get the size of the viewport
	var viewport_size = get_viewport_rect().size
	
	# Keep the player within the viewport boundaries
	position.x = clamp(position.x, 0, viewport_size.x)
	position.y = clamp(position.y, 0, viewport_size.y)

func end_game():
	# Change to the game over scene
	get_tree().change_scene_to_file("res://gameover.tscn")
