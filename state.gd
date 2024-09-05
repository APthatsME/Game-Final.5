extends Node2D
class_name State

@onready var debug = owner.find_child("Debug")  # Reference to the Debug node
@onready var player = owner.get_parent().find_child("player")  # Reference to the player node
@onready var speed = owner.find_child("Speed")  # Reference to the Speed node
@onready var duration = owner.find_child("Duration")  # Reference to the Duration node

var can_transition: bool = false  # Whether the state can transition

func _ready():
	set_physics_process(false)  # Disable physics processing
	duration.timeout.connect(_on_duration_timeout)  # Connect duration timeout to handler

func _on_duration_timeout():
	can_transition = true  # Allow transition when duration times out

func enter():
	set_physics_process(true)  # Enable physics processing
	can_transition = false  # Reset transition flag
	duration.start()  # Start the duration timer

func exit():
	set_physics_process(false)  # Disable physics processing
	
func transition():
	pass  # Override in subclasses to define state transitions

func _physics_process(_delta):
	transition()  # Call the transition function each frame
	debug.text = name  # Update the debug text with the state name
