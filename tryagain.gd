extends Node

# Restart the game when the "Tray Again" button is pressed
func _on_trayagain_pressed():
	get_tree().change_scene_to_file("res://boss_room.tscn")
