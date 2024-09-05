extends CharacterBody2D

var theta: float = 0.0  # Angle for shooting direction
@export_range(0,2*PI) var alpha: float = 0.0  # Adjustable angle offset

@export var bullet_node: PackedScene  # Scene for the bullet
var bullet_type: int = 0  # Type of bullet

# Calculate the direction based on the angle
func get_vector(angle):
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

# Shoot a bullet in the given direction
func shoot(angle):
	var bullet = bullet_node.instantiate()
	bullet.position = global_position
	bullet.direction = get_vector(angle)
	bullet.set_property(bullet_type)
	get_tree().current_scene.call_deferred("add_child", bullet)

# Called when the speed timer runs out to shoot
func _on_speed_timeout():
	shoot(theta)
