extends Control

# Called when the node enters the scene tree for the first time
func _ready():
	pass # This is a placeholder; you can add initialization code here

# Start the game when the start button is pressed
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://boss_room.tscn")

# Quit the game when the quit button is pressed
func _on_quit_button_pressed():
	get_tree().quit()
