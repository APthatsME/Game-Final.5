extends Node2D

var current_state: State  # The current state object
var previous_state: State  # The previous state object

# Initialize the states when the scene is ready
func _ready():
	current_state = get_child(0) as State  # Set the first child as the initial state
	previous_state = current_state
	current_state.enter()  # Call the enter function on the current state

# Function to change the current state
func change_state(state):
	if state == previous_state.name:
		return  # Don't change if the new state is the same as the previous one

	current_state = find_child(state) as State  # Find and set the new state
	current_state.enter()  # Enter the new state

	previous_state.exit()  # Exit the previous state
	previous_state = current_state  # Update the previous state
