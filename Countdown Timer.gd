extends Node
class_name Countdown

@onready var label = $Label  # Reference to the label node
@onready var timer = $Timer  # Reference to the timer node
@onready var animated_sprite = $AnimatedSprite2D2  # Reference to the animated sprite
var current_animation = ""  # Track the current animation

# Hide the countdown initially
func _ready():
	self.visible = false

# Get the remaining time in minutes and seconds
func time_left():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

# Update the label text and check for sprite changes every frame
func _process(_delta):
	label.text = "%02d:%02d" % time_left()
	check_for_sprite_change()

# Change scene when the timer runs out
func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://win.tscn")

# Show the countdown and start the timer when the player is detected
func _on_player_detection_body_entered(body):
	self.visible = true
	timer.start()

# Change the sprite's animation based on the time left
func check_for_sprite_change():
	var time_left = int(timer.time_left)
	
	# Switch animations as time decreases
	if time_left <= 60 and time_left > 50 and current_animation != "Alarmed":
		animated_sprite.play("Alarmed")
		current_animation = "Alarmed"
	elif time_left <= 50 and time_left > 40 and current_animation != "Angry":
		animated_sprite.play("Angry")
		current_animation = "Angry"
	elif time_left <= 40 and time_left > 30 and current_animation != "Furious":
		animated_sprite.play("Furious")
		current_animation = "Furious"
	elif time_left <= 30 and time_left > 10 and current_animation != "Unamused":
		animated_sprite.play("Unamused")
		current_animation = "Unamused"
